// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package main

import (
	"fmt"
	"os"
)

// Usage: formula_templater <product> <version> <configPath>
// Example: formula_templater vault 1.6.3 ./config.hcl
func main() {
	if len(os.Args) < 4 || len(os.Args) > 5 {
		fmt.Printf("Usage: %s [-cask] PRODUCT VERSION CONFIG_PATH", os.Args[0])
		os.Exit(1)
	}

	i := 0
	cask := false
	if os.Args[1] == "-cask" {
		cask = true
		i += 1
	}

	product := os.Args[i+1]
	version := os.Args[i+2]
	config := os.Args[i+3]

	if cask {
		if err := printCask(product, version, config, os.Stdout); err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
		os.Exit(0)
	}

	if err := printFormula(product, version, config, os.Stdout); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	os.Exit(0)
}
