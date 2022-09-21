package main

import (
	"errors"

	"github.com/hashicorp/hcl/v2/hclsimple"
)

// Config configuration top level options
type Config struct {
	Formulae []FormulaConfig `hcl:"formula,block"`
}

// FormulaConfig all required formula data
type FormulaConfig struct {
	Product       string `hcl:"product"`
	Variant       string `hcl:"variant,optional"`
	Name          string `hcl:"name"`
	Desc          string `hcl:"desc"`
	Homepage      string `hcl:"homepage"`
	Version       string
	Architectures FormulaArchitectures `hcl:"architectures,block"`
	Depends       []string             `hcl:"depends,optional"`
	Plist         string               `hcl:"plist,optional"`
	PlistOptions  string               `hcl:"plist_options,optional"`
	Cask          bool                 `hcl:"cask,optional"`
	CaskApp       string               `hcl:"cask_app,optional"`
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

func (c Config) getFormula(product string) (FormulaConfig, error) {
	for _, formula := range c.Formulae {
		if formula.Product == product {
			return formula, nil
		}
	}
	return FormulaConfig{}, errors.New("Formula not found")
}
