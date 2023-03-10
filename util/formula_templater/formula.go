package main

import (
	"fmt"
	"io"
	"strings"
	"text/template"
)

func printFormula(product, version, configLocation string, out io.Writer) error {
	shasums, err := loadShasums(product, version)
	if err != nil {
		return err
	}

	config, err := loadConfig(configLocation)
	if err != nil {
		return err
	}

	productConfig, err := config.getFormula(product)
	if err != nil {
		return err
	}

	productConfig.Version = version

	var t *template.Template
	if productConfig.Cask {
		dmg := fmt.Sprintf("%s_%s_%s.dmg", product, version, "darwin_amd64")
		productConfig.Architectures.DarwinAmd64SHA = shasums[dmg]

		t = template.Must(template.New("cask").Parse(caskTemplate))
	} else {
		if productConfig.Architectures.DarwinAmd64 {
			sha := getShasum(shasums, product, version, "darwin_amd64")
			productConfig.Architectures.DarwinAmd64SHA = sha
		}

		if productConfig.Architectures.DarwinArm64 {
			sha := getShasum(shasums, product, version, "darwin_arm64")
			productConfig.Architectures.DarwinArm64SHA = sha
		}

		if productConfig.Architectures.LinuxAmd64 {
			sha := getShasum(shasums, product, version, "linux_amd64")
			productConfig.Architectures.LinuxAmd64SHA = sha
		}

		if productConfig.Architectures.LinuxArm {
			sha := getShasum(shasums, product, version, "linux_arm")
			productConfig.Architectures.LinuxArmSHA = sha
		}

		if productConfig.Architectures.LinuxArm64 {
			sha := getShasum(shasums, product, version, "linux_arm64")
			productConfig.Architectures.LinuxArm64SHA = sha
		}

		// For enterprise products only, set a Variant variable to 'enterprise'
		// and update the product name to be the base product without the variant
		// e.g. product name will be 'vault' instead of 'vault-enterprise
		// This is needed to produce the right Formula.rb files for ENT products
		if strings.HasSuffix(strings.ToLower(productConfig.Product), "-enterprise") {
			productConfig.Variant = "enterprise"
			productConfig.Product = strings.TrimSuffix(productConfig.Product, "-enterprise")
		}

		t = template.Must(template.New("formula").Parse(formulaTemplate))
	}

	return t.Execute(out, productConfig)
}

const formulaTemplate = `# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class {{ .Name }} < Formula
  desc "{{ .Desc }}"
  homepage "{{ .Homepage }}"
  version "{{ .Version }}"

  {{- if and .Architectures.DarwinAmd64 .Architectures.DarwinArm64 }}

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/{{ .Product }}/{{ .Version }}/{{ .Product }}_{{ .Version }}_darwin_amd64.zip"
    sha256 "{{ .Architectures.DarwinAmd64SHA }}"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/{{ .Product }}/{{ .Version }}/{{ .Product }}_{{ .Version }}_darwin_arm64.zip"
    sha256 "{{ .Architectures.DarwinArm64SHA }}"
  end
  {{- else }}

  if OS.mac?
    url "https://releases.hashicorp.com/{{ .Product }}/{{ .Version }}/{{ .Product }}_{{ .Version }}_darwin_amd64.zip"
    sha256 "{{ .Architectures.DarwinAmd64SHA }}"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end
  {{- end }}
  {{- if .Architectures.LinuxAmd64 }}

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/{{ .Product }}/{{ .Version }}/{{ .Product }}_{{ .Version }}_linux_amd64.zip"
    sha256 "{{ .Architectures.LinuxAmd64SHA }}"
  end
  {{- end }}
  {{- if .Architectures.LinuxArm }}

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/{{ .Product }}/{{ .Version }}/{{ .Product }}_{{ .Version }}_linux_arm.zip"
    sha256 "{{ .Architectures.LinuxArmSHA }}"
  end
  {{- end }}
  {{- if .Architectures.LinuxArm64 }}

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/{{ .Product }}/{{ .Version }}/{{ .Product }}_{{ .Version }}_linux_arm64.zip"
    sha256 "{{ .Architectures.LinuxArm64SHA }}"
  end

  {{- end }}

  {{- with .Depends }}
  {{ range $index, $element := . }}
  depends_on "{{ . }}"
  {{- end }}
  {{- end}}

  {{- with .Recommends }}
  {{ range $index, $element := . }}
  depends_on "{{ . }}" => :recommended
  {{- end }}
  {{- end}}

  {{- if .Variant }}

  conflicts_with "{{ .Product }}-{{ .Variant }}"
  {{- else }}

  conflicts_with "{{ .Product }}"
  {{- end }}

  def install
    bin.install "{{ .Product }}"
  end
  {{- if .ServiceArgs }}

  service do
    run [bin/"{{ .Product }}"{{ range .ServiceArgs }}, "{{ . }}"{{ end }}]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/{{ .Product }}.log"
    error_log_path var/"log/{{ .Product }}.log"
  end
  {{- end }}

  test do
    system "#{bin}/{{ .Product }} --version"
  end
end
`

const caskTemplate = `# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
cask "hashicorp-{{ .Product }}" do
  version "{{ .Version }}"
  sha256 "{{ .Architectures.DarwinAmd64SHA }}"

  url "https://releases.hashicorp.com/{{ .Product }}/#{version}/{{ .Product }}_#{version}_darwin_amd64.dmg",
      verified: "hashicorp.com/{{ .Product }}/"
  name "{{ .Name }}"
  desc "{{ .Desc }}"
  homepage "{{ .Homepage }}"

  {{- if eq .Product "vagrant" }}

  livecheck do
    url "https://github.com/hashicorp/{{ .Product }}"
    strategy :git
  end
  {{- end }}

  {{- if .CaskApp }}

  app "{{ .CaskApp }}"
  {{- else }}

  pkg "{{ .CaskPkg }}"
  {{- end }}

  {{- if eq .Product "vagrant" }}

  uninstall script: {
    executable: "uninstall.tool",
    input: ["Yes"],
    sudo:  true,
  },
  pkgutil: "com.{{ .Product}}.{{ .Product }}"

  zap trash: "~/.{{ .Product }}.d"
  {{- end}}

end
`
