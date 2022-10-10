package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"io/ioutil"
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

	// Form the appropriate Releases API request URL
	release := ReleaseResponse{}

	if license_class == "enterprise" {
		productName = strings.TrimSuffix(productName, "-enterprise")
	}
	url := fmt.Sprintf("%s/%s/latest?license_class=%s", apiBaseURL, productName, license_class)

	// Make a GET request to the Releases API to fetch
	// the latest version of the given product
	fmt.Printf("Reading %s", url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	// Log the status code and response body from non-200 responses
	if resp.StatusCode != http.StatusOK {
		fmt.Println("\nNon-OK HTTP status:", resp.StatusCode)
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			return nil, err
		}
		bodyString := string(body)
		fmt.Println("Response body:",bodyString)
		return nil, err
	}

	// On 200 responses, decode the response into our Release struct
	if err := json.NewDecoder(resp.Body).Decode(&release); err != nil {
		return nil, err
	}

	// Return the version 
	return &release.Version, nil
}
