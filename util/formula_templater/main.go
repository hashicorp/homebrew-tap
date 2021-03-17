package main

import (
	"fmt"
	"os"
)

func main() {
	product := "vault"
	version := "1.6.3"

	err := printFormula(product, version, "./config.hcl")
	if err != nil {
		fmt.Println(err)
	}
	os.Exit(0)
}
