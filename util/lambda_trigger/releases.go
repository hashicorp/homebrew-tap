// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strings"
)

type ReleaseResponse Release

type Release struct {
	Version string
}

// Return the latest version of a given product
// which is fetched from the Releases API, api.releases.hashicorp.com
func getLatestVersion(productName string) (*string, error) {
	apiBaseURL := "https://api.releases.hashicorp.com/v1/releases"
	// Set `license_class` to ent for ENT products
	// since that is required in the Releases API call to get latest
	license_class := "oss"
	if strings.HasSuffix(strings.ToLower(productName), "-enterprise") {
		license_class = "enterprise"
	}

	if license_class == "enterprise" {
		productName = strings.TrimSuffix(productName, "-enterprise")
	}
	url := fmt.Sprintf("%s/%s/latest?license_class=%s", apiBaseURL, productName, license_class)

	// Make a GET request to the Releases API to fetch
	// the latest version of the given product
	log.Printf("Reading %s", url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	// Log the status code and response body from non-200 responses
	if resp.StatusCode != http.StatusOK {
		log.Println("\nNon-OK HTTP status:", resp.StatusCode)
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			return nil, err
		}
		bodyString := string(body)
		log.Println("Response body:", bodyString)
		return nil, err
	}
	var release ReleaseResponse
	if err := json.NewDecoder(resp.Body).Decode(&release); err != nil {
		return nil, err
	}

	// TODO: We only support publishing the "base" variants for oss and enterprise.
	latestVersion, _, _ := strings.Cut(release.Version, "+") // "1.13.3+ent.hsm.fips1402"
	switch license_class {
	case "enterprise":
		v := fmt.Sprintf("%s+ent", latestVersion)
		return &v, nil
	case "oss":
		return &latestVersion, nil
	default: // exhaustive check
		panic("unknown license_class")
	}
}
