package main

import (
	hb "github.com/gulducat/hashi-bin/types"
)

const ReleasesURL = "https://releases.hashicorp.com/index.json"

func getLatestVersion(productName string) (*hb.Version, error) {
	index, err := hb.NewIndex(ReleasesURL)
	if err != nil {
		return &hb.Version{}, err
	}
	product, err := index.GetProduct(productName)
	if err != nil {
		return &hb.Version{}, err
	}
	return product.LatestVersion(), nil
}
