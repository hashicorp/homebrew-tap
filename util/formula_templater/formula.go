package main

import (
	"fmt"
	"io"
	"text/template"
)

func printFormula(product string, version string, configLocation string, out io.Writer) error {
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
	if productConfig.Cask == true {
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

		t = template.Must(template.New("formula").Parse(formulaTemplate))
	}

	return t.Execute(out, productConfig)
}

const formulaTemplate = `class {{ .Name }} < Formula
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

  bottle :unneeded

  {{- with .Depends }}
  {{ range $index, $element := . }}
  depends_on "{{ . }}"
  {{- end }}
  {{- end}}

  conflicts_with "{{ .Product }}"

  def install
    bin.install "{{ .Product }}"
  end

  {{- if .Plist }}

  plist_options manual: "{{ .PlistOptions }}"

  def plist; <<~EOS
{{ .Plist }}
EOS
  end
  {{- end}}

  test do
    system "#{bin}/{{ .Product }} --version"
  end
end
`

const caskTemplate = `cask "hashicorp-{{ .Product }}" do
  version "{{ .Version }}"
  sha256 "{{ .Architectures.DarwinAmd64SHA }}"

  url "https://releases.hashicorp.com/{{ .Product }}/#{version}/{{ .Product }}_#{version}_darwin_amd64.dmg"
  name "{{ .Name }}"
  desc "{{ .Desc }}"
  homepage "{{ .Homepage }}"

  app "{{ .CaskApp }}"
end
`
