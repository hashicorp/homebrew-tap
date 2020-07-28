package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	semver "github.com/coreos/go-semver/semver"
)

// ReleaseResponse object format from releases.hashicorp.com/*/index.json
type ReleaseResponse struct {
	Name     string
	Versions map[string]ReleaseVersion
}

// ReleaseVersion name, version, and shasum of a release
type ReleaseVersion struct {
	Name             string
	Version          string
	Shasums          string
	ShasumsSignature string
	Builds           []ReleaseBuild
}

// ReleaseBuild individual build information of a release
type ReleaseBuild struct {
	Name     string
	Version  string
	OS       string
	Arch     string
	Filename string
	URL      string
}

func getLatestReleaseVersion(product string) (ReleaseVersion, error) {
	resp, err := http.Get(fmt.Sprintf("https://releases.hashicorp.com/%s/", product))
	if err != nil {
		return ReleaseVersion{}, err
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return ReleaseVersion{}, err
	}

	releaseResponse := &ReleaseResponse{}
	err = json.Unmarshal([]byte(body), releaseResponse)
	if err != nil {
		return ReleaseVersion{}, err
	}

	latest := ReleaseVersion{Version: "0.0.0"}

	for versionString, releaseVersion := range releaseResponse.Versions {
		less, err := compareVersionStrings(latest.Version, versionString)
		if err != nil || less {
			latest = releaseVersion
		}
	}

	return latest, nil
}

func compareVersionStrings(a string, b string) (bool, error) {
	aVersion, err := semver.NewVersion(a)
	if err != nil {
		return false, err
	}

	bVersion, err := semver.NewVersion(b)
	if err != nil {
		return false, err
	}

	return aVersion.LessThan(*bVersion), nil
}
