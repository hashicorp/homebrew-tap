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
