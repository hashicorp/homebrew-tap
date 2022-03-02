package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

const test_product = "nomad"
const test_version = "1.2.6"

func TestGetFormulaVersion(t *testing.T) {
	gotLatest, err := getFormulaVersion(test_product)

	require.Nil(t, err)
	assert.Equal(t, test_version, gotLatest)
}

func TestGetLatestVersion(t *testing.T) {
	gotLatest, err := getLatestVersion(test_product)

	require.Nil(t, err)
	assert.Equal(t, test_version, gotLatest.Version)
}
