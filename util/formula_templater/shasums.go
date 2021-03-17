package main

import (
	"fmt"
	"io"
	"net/http"
	"strings"
)

func loadShasums(product string, version string) (map[string]string, error) {
	shasums := make(map[string]string)
	shasumURL := fmt.Sprintf("https://releases.hashicorp.com/%s/%s/%s_%s_SHA256SUMS", product, version, product, version)
	resp, err := http.Get(shasumURL)
	if err != nil {
		return shasums, err
	}
	defer resp.Body.Close()
	body, err := io.ReadAll(resp.Body)

	lines := strings.Split(string(body), "\n")
	for _, l := range lines {
		if len(l) > 0 {
			parts := strings.Split(l, "  ")
			shasum := parts[0]
			zip := parts[1]
			shasums[zip] = shasum
		}
	}

	return shasums, nil
}

func getShasum(shasums map[string]string, product string, version string, arch string) string {
	zip := fmt.Sprintf("%s_%s_%s.zip", product, version, arch)
	return shasums[zip]
}
