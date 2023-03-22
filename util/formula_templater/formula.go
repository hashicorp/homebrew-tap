package main

import (
	"fmt"
	"io"
	"strings"
	"text/template"
  _ "embed"
)
//go:embed templates/formula.tmpl
var formulaTemplate string

//go:embed templates/cask.tmpl
var caskTemplate string

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
