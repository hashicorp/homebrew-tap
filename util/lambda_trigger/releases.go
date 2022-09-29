package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
)

type ReleaseResponse Release

type Release struct {
	Version string
}

func releasesAPIRequest(apiBaseURL, productName string, license_class string) (*string, error) {
	release := ReleaseResponse{}
	url := fmt.Sprintf("%s/%s/latest", apiBaseURL, productName)
	// For ENT products, set the license_class parameter to filter by ENT-only
	if license_class == "enterprise" {
		productName = strings.TrimSuffix(productName, "-enterprise")
		url = fmt.Sprintf("%s/%s/latest?license_class=enterprise", apiBaseURL, productName)
	}

	fmt.Printf("Reading %s", url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if err := json.NewDecoder(resp.Body).Decode(&release); err != nil {
		return nil, err
	}

	return &release.Version, nil
}

func getLatestVersion(productName string) (*string, error) {
	baseURL := "https://api.releases.hashicorp.com/v1/releases"
	// Set `license_class` to ent for ENT products
	// since that is required in the releases API call to get latest
	license_class := "oss"
	if strings.HasSuffix(strings.ToLower(productName), "-enterprise") {
		license_class = "enterprise"
	}
	release, err := releasesAPIRequest(baseURL, productName, license_class)

	if err != nil {
		return nil, err
	}

	return release, nil
}
