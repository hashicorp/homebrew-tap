// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package main

import (
	_ "embed"
	"fmt"
	"io"
	"strings"
	"text/template"
)

//go:embed templates/formula.tmpl
var formulaTemplate string

//go:embed templates/cask.tmpl
var caskTemplate string

func printCask(product, version, configLocation string, out io.Writer) error {
	shasums, err := loadShasums(product, version)
	if err != nil {
		return err
	}

	config, err := loadConfig(configLocation)
	if err != nil {
		return err
	}

	productConfig, err := config.getCask(product)
	if err != nil {
		return err
	}
	productConfig.Version = version

	if productConfig.Architectures.DarwinAmd64 {
		dmg := fmt.Sprintf("%s_%s_%s.dmg", product, version, "darwin_amd64")
		productConfig.Architectures.DarwinAmd64SHA = shasums[dmg]
	}

	if productConfig.Architectures.DarwinArm64 {
		dmg := fmt.Sprintf("%s_%s_%s.dmg", product, version, "darwin_arm64")
		productConfig.Architectures.DarwinArm64SHA = shasums[dmg]
	}

	t := template.Must(template.New("cask").Parse(caskTemplate))

	return t.Execute(out, productConfig)
}

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
	if productConfig.Architectures.DarwinAmd64 {
		sha, err := getShasum(shasums, product, version, "darwin_amd64")
		if err != nil {
			return fmt.Errorf("no SHA found for darwin_amd64: %w", err)
		}
		productConfig.Architectures.DarwinAmd64SHA = sha
	}

	if productConfig.Architectures.DarwinArm64 {
		sha, err := getShasum(shasums, product, version, "darwin_arm64")
		if err != nil {
			return fmt.Errorf("no SHA found for darwin_arm64: %w", err)
		}
		productConfig.Architectures.DarwinArm64SHA = sha
	}

	if productConfig.Architectures.LinuxAmd64 {
		sha, err := getShasum(shasums, product, version, "linux_amd64")
		if err != nil {
			return fmt.Errorf("no SHA found for linux_amdd64: %w", err)
		}
		productConfig.Architectures.LinuxAmd64SHA = sha
	}

	if productConfig.Architectures.LinuxArm {
		sha, err := getShasum(shasums, product, version, "linux_arm")
		if err != nil {
			return fmt.Errorf("no SHA found for linux_arm: %w", err)
		}
		productConfig.Architectures.LinuxArmSHA = sha
	}

	if productConfig.Architectures.LinuxArm64 {
		sha, err := getShasum(shasums, product, version, "linux_arm64")
		if err != nil {
			return fmt.Errorf("no SHA found for linux_arm64: %w", err)
		}
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

	t := template.Must(template.New("formula").Parse(formulaTemplate))

	return t.Execute(out, productConfig)
}
