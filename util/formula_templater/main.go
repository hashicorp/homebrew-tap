package main

import (
	"fmt"
	"os"
)

// Usage: formula_templater <product> <version> <configPath>
// Example: formula_templater vault 1.6.3 ./config.hcl
func main() {
	product := os.Args[1]
	version := os.Args[2]
	config := os.Args[3]

	err := printFormula(product, version, config)
	if err != nil {
		fmt.Println(err)
	}
	os.Exit(0)
}
