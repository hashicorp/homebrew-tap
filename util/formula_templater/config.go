package main

import (
	"github.com/hashicorp/hcl/v2/hclsimple"
)

// Config configuration top level options
type Config struct {
	Formulae []FormulaConfig `hcl:"formulae"`
}

// FormulaConfig all required formula data
type FormulaConfig struct {
	Product       string `hcl:"product"`
	Name          string `hcl:"name"`
	Desc          string `hcl:"desc"`
	Homepage      string `hcl:"homepage"`
	Version       string
	Architectures FormulaArchitectures `hcl:"architectures"`
	Depends       []string             `hcl:"depends"`
	Plist         string               `hcl:"plist"`
	PlistOptions  string               `hcl:"plist_options"`
}

// FormulaArchitectures architecture support
type FormulaArchitectures struct {
	DarwinAmd64    bool `hcl:"darwin_amd64"`
	DarwinAmd64SHA string
	DarwinArm64    bool `hcl:"darwin_arm64"`
	DarwinArm64SHA string
	LinuxAmd64     bool `hcl:"linux_amd64"`
	LinuxAmd64SHA  string
	LinuxArm       bool `hcl:"linux_arm"`
	LinuxArmSHA    string
	LinuxArm64     bool `hcl:"linux_arm64"`
	LinuxArm64SHA  string
}

func loadConfig(filepath string) (Config, error) {
	var config Config

	err := hclsimple.DecodeFile(filepath, nil, &config)

	return config, err
}

func (c Config) getFormula(product string) FormulaConfig {
	for _, formula := range c.Formulae {
		if formula.Product == product {
			return formula
		}
	}
	return FormulaConfig{}
}
