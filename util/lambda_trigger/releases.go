package main

import (
	"fmt"
	"net/url"

	hb "github.com/gulducat/hashi-bin/types"
)

// ReleasesURL The url to read the releases index from
const ReleasesURL = "https://releases.hashicorp.com"

func getLatestVersion(productName string) (*hb.Version, error) {
	safeProduct := url.PathEscape(productName)
	url := fmt.Sprintf("%s/%s/%s", ReleasesURL, safeProduct, "index.json")
	product, err := hb.NewProduct(url)
	if err != nil {
		return &hb.Version{}, err
	}
	return product.LatestVersion(), nil
}
