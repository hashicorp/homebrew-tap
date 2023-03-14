package main

import (
	"testing"

	"github.com/h2non/gock"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

const test_oss_product_formula = "nomad"
const test_oss_product_cask = "boundary-desktop"
const test_ent_product_formula = "nomad-enterprise"
const test_oss_version_formula = "1.3.5"
const test_ent_version_formula = "1.3.5+ent"
const test_oss_version_cask = "1.5.0"

func TestOSSGetFormulaVersion(t *testing.T) {
	defer gock.Off()
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Formula/nomad.rb").
		Reply(200).
		File("testdata/github.com_formula_nomad.rb")

	gotLatest, err := getFormulaVersion(test_oss_product_formula)

	require.NoError(t, err)
	assert.Equal(t, test_oss_version_formula, gotLatest)
}

func TestOSSGetLatestVersion(t *testing.T) {
	defer gock.Off()
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/nomad/latest").
		MatchParam("license_class", "oss").
		Reply(200).
		File("testdata/releases.com_nomad-oss.json")

	gotLatest, err := getLatestVersion(test_oss_product_formula)

	require.NoError(t, err)
	assert.Equal(t, test_oss_version_formula, *gotLatest)
}

func TestOSSGetCaskVersion(t *testing.T) {
	defer gock.Off()
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Casks/hashicorp-boundary-desktop.rb").
		Reply(200).
		File("testdata/github.com_cask_boundary-desktop.rb")

	gotLatest, err := getCaskVersion(test_oss_product_cask)

	require.NoError(t, err)
	assert.Equal(t, test_oss_version_cask, gotLatest)
}

func TestOSSGetLatestCaskVersion(t *testing.T) {
	defer gock.Off()
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/boundary-desktop/latest").
		MatchParam("license_class", "oss").
		Reply(200).
		File("testdata/releases.com_boundary-desktop.json")

	gotLatest, err := getLatestVersion(test_oss_product_cask)

	require.NoError(t, err)
	assert.Equal(t, test_oss_version_cask, *gotLatest)
}

func TestENTGetFormulaVersion(t *testing.T) {
	defer gock.Off()
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Formula/nomad-enterprise.rb").
		Reply(200).
		File("testdata/github.com_formula_nomad-enterprise.rb")

	gotLatest, err := getFormulaVersion(test_ent_product_formula)

	require.NoError(t, err)
	assert.Equal(t, test_ent_version_formula, gotLatest)
}

func TestENTGetLatestVersion(t *testing.T) {
	defer gock.Off()
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/nomad/latest").
		MatchParam("license_class", "enterprise").
		Reply(200).
		File("testdata/releases.com_nomad-enterprise.json")

	gotLatest, err := getLatestVersion(test_ent_product_formula)

	require.NoError(t, err)
	assert.Equal(t, test_ent_version_formula, *gotLatest)
}
