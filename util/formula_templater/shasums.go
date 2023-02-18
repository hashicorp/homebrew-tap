package main

import (
	"fmt"
	"io"
	"net/http"
	"strings"
)

// For enterprise products, remove the "-enterprise" suffix
// from the product name so that we can successfully get the SHASUMS
// e.g. product name will be 'vault' instead of 'vault-enterprise'
// For non-enterprise products, return the product name as-is
func returnProduct(product string) string {
	if strings.HasSuffix(strings.ToLower(product), "-enterprise") {
		product = strings.TrimSuffix(product, "-enterprise")
	}
	return product
}

func loadShasums(product, version string) (map[string]string, error) {
	product = returnProduct(product)
	shasums := make(map[string]string)
	shasumURL := fmt.Sprintf("https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS", product, version, product, version)
	resp, err := http.Get(shasumURL)
	if err != nil {
		return shasums, err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}

	lines := strings.Split(string(body), "\n")
	for _, l := range lines {
		if len(l) > 0 {
			parts := strings.Split(l, "  ")
			if len(parts) == 2 {
				shasum := parts[0]
				zip := parts[1]
				shasums[zip] = shasum
			}
		}
	}

	return shasums, nil
}

func getShasum(shasums map[string]string, product, version, arch string) string {
	product = returnProduct(product)
	zip := fmt.Sprintf("%s_%s_%s.zip", product, version, arch)
	return shasums[zip]
}
