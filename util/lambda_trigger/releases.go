package main

import (
	"fmt"

	hb "github.com/gulducat/hashi-bin/types"
)

// ReleasesURL The url to read the releases index from
const ReleasesURL = "https://hc-releases-prod.s3.amazonaws.com"

func getLatestVersion(productName string) (*hb.Version, error) {
	url := fmt.Sprintf("%s/%s/%s", ReleasesURL, productName, "index.json")
	product, err := hb.NewProduct(url)
	if err != nil {
		return &hb.Version{}, err
	}
	return product.LatestVersion(), nil
}
