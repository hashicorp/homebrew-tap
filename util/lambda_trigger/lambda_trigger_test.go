package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

const test_oss_product = "nomad"
const test_ent_product = "nomad-enterprise"
const test_oss_version = "1.3.5"
const test_ent_version = "1.3.5+ent"

func TestOSSGetFormulaVersion(t *testing.T) {
	gotLatest, err := getFormulaVersion(test_oss_product)

	require.Nil(t, err)
	assert.Equal(t, test_oss_version, gotLatest)
}

func TestOSSGetLatestVersion(t *testing.T) {
	gotLatest, err := getLatestVersion(test_oss_product)

	require.Nil(t, err)
	assert.Equal(t, test_oss_version, gotLatest.Version)
}

// These ENT tests will fail until
// the ENT products are made available at
// https://raw.githubusercontent.com/hashicorp/homebrew-tap/master/Formula/$ENT_PRODUCT_NAME.rb
func TestENTGetFormulaVersion(t *testing.T) {
	gotLatest, err := getFormulaVersion(test_ent_product)

	require.Nil(t, err)
	assert.Equal(t, test_ent_version, gotLatest)
}

func TestENTGetLatestVersion(t *testing.T) {
	gotLatest, err := getLatestVersion(test_ent_product)

	require.Nil(t, err)
	assert.Equal(t, test_ent_version, gotLatest.Version)
}
