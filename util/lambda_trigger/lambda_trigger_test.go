package main

import (
	"testing"

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
	gotLatest, err := getFormulaVersion(test_oss_product_formula)

	require.Nil(t, err)
	assert.Equal(t, test_oss_version_formula, gotLatest)
}

func TestOSSGetLatestVersion(t *testing.T) {
	gotLatest, err := getLatestVersion(test_oss_product_formula)

	require.Nil(t, err)
	assert.Equal(t, test_oss_version_formula, *gotLatest)
}

func TestOSSGetCaskVersion(t *testing.T) {
	gotLatest, err := getCaskVersion(test_oss_product_cask)

	require.Nil(t, err)
	assert.Equal(t, test_oss_version_cask, gotLatest)
}

func TestOSSGetLatestCaskVersion(t *testing.T) {
	gotLatest, err := getLatestVersion(test_oss_product_cask)

	require.Nil(t, err)
	assert.Equal(t, test_oss_version_cask, *gotLatest)
}

func TestENTGetFormulaVersion(t *testing.T) {
	gotLatest, err := getFormulaVersion(test_ent_product_formula)

	require.Nil(t, err)
	assert.Equal(t, test_ent_version_formula, gotLatest)
}

func TestENTGetLatestVersion(t *testing.T) {
	gotLatest, err := getLatestVersion(test_ent_product_formula)

	require.Nil(t, err)
	assert.Equal(t, test_ent_version_formula, *gotLatest)
}
