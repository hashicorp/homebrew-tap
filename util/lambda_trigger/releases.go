package main

import (
	hr "github.com/gulducat/hashi-bin/types"
)

const ReleasesURL = "https://releases.hashicorp.com/index.json"

func getLatestVersion(productName string) (*hr.Version, error) {
	index, err := hr.NewIndex(ReleasesURL)
	if err != nil {
		return &hr.Version{}, err
	}
	product, err := index.GetProduct(productName)
	if err != nil {
		return &hr.Version{}, err
	}
	return product.LatestVersion(), nil
}
