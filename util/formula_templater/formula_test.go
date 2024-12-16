// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package main

import (
	"bytes"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestPrintOSSFormula(t *testing.T) {
	expect, err := os.ReadFile("testdata/consul.rb")
	require.NoError(t, err)

	product := "consul"
	version := "1.15.1"
	config := "./config.hcl"
	buf := new(bytes.Buffer)

	err = printFormula(product, version, config, buf)
	require.NoError(t, err)
	assert.Equal(t, string(expect), buf.String())
}

func TestPrintOSSCask(t *testing.T) {
	expect, err := os.ReadFile("testdata/boundary-desktop-cask.rb")
	require.NoError(t, err)

	product := "boundary-desktop"
	version := "1.6.0"
	config := "./config.hcl"
	buf := new(bytes.Buffer)

	err = printCask(product, version, config, buf)
	require.NoError(t, err)
	assert.Equal(t, string(expect), buf.String())
}

func TestPrintOSSCaskMultiArch(t *testing.T) {
	expect, err := os.ReadFile("testdata/vagrant-cask.rb")
	require.NoError(t, err)

	product := "vagrant"
	version := "2.3.6"
	config := "./config.hcl"
	buf := new(bytes.Buffer)

	err = printCask(product, version, config, buf)
	require.NoError(t, err)
	assert.Equal(t, string(expect), buf.String())
}

func TestPrintOSSFormulaNoMac(t *testing.T) {
	expect, err := os.ReadFile("testdata/vagrant-formula.rb")
	require.NoError(t, err)

	product := "vagrant"
	version := "2.3.6"
	config := "./config.hcl"
	buf := new(bytes.Buffer)

	err = printFormula(product, version, config, buf)
	require.NoError(t, err)
	assert.Equal(t, string(expect), buf.String())
}

func TestPrintENTFormula(t *testing.T) {
	expect, err := os.ReadFile("testdata/consul-enterprise.rb")
	require.NoError(t, err)

	product := "consul-enterprise"
	version := "1.15.1+ent"
	config := "./config.hcl"
	buf := new(bytes.Buffer)

	err = printFormula(product, version, config, buf)
	require.NoError(t, err)
	assert.Equal(t, string(expect), buf.String())
}

func TestVariantHandling(t *testing.T) {
	product := "vault-enterprise"
	version := "1.13.0+ent.hsm.fips1402"
	config := "./config.hcl"
	buf := new(bytes.Buffer)

	err := printFormula(product, version, config, buf)
	assert.Error(t, err)
	// Check the error, mostly to check the error contains actionable information.
	// It currently relies on ordering (darwin_amd64 is tested first), so if that changes test case should be updated
	// as needed.
	assert.ErrorContains(t, err, "no SHA found for darwin_amd64: no value found for `vault_1.13.0+ent.hsm.fips1402_darwin_amd64.zip`")
}
