// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/url"
	"os"
	"testing"
	"time"

	"github.com/aws/aws-lambda-go/events"
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

func TestNewProduct(t *testing.T) {
	defer gock.Off()
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Formula/a-new-product.rb").
		Reply(404)
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Cask/a-new-product.rb").
		Reply(404)

	_, err := getFormulaVersion("a-new-product")
	require.Error(t, err, errBrewVersionNotFound)

	_, err = getCaskVersion("a-new-product")
	require.Error(t, err, errBrewVersionNotFound)
}

func TestGitHubTrigger(t *testing.T) {
	defer gock.Off()

	// Validate the POST payload contains the minimum subset we expect
	triggerPayload := map[string]any{
		"event_type": "version-updated",
		"client_payload": map[string]any{
			"name":    "a-new-app",
			"version": "0.1.0",
			"cask":    "false",
		},
	}

	gock.New("https://api.github.com").
		Post("/repos/hashicorp/homebrew-tap/dispatches").
		HeaderPresent("Authorization").
		MatchType("json").
		JSON(triggerPayload).
		Reply(204).
		BodyString("")

	err := triggerGithubWorkflow(&ReleaseEvent{
		Product: "a-new-app",
		Version: "0.1.0",
		Cask:    false,
	})
	assert.NoError(t, err)

	gock.New("https://api.github.com").
		Post("/repos/hashicorp/not-homebrew-tap/dispatches").
		HeaderPresent("Authorization").
		MatchType("json").
		JSON(triggerPayload).
		Reply(403)

	err = triggerGithubWorkflow(&ReleaseEvent{
		Product: "a-new-app",
		Version: "0.1.0",
		Cask:    false,
	})
	assert.Error(t, err)
}

func TestHandleLambdaEventUnuspportedProduct(t *testing.T) {
	unsupportedRecord := events.SNSEventRecord{
		EventSource: "test",
		SNS: events.SNSEntity{
			Timestamp: time.Now(),
			Message:   `{"product": "an-unsupported-app"}`,
			MessageID: "deadbeef",
		},
	}
	err := HandleLambdaEvent(events.SNSEvent{
		Records: []events.SNSEventRecord{unsupportedRecord},
	})
	assert.NoError(t, err)
}

func TestHandleLambdaEventExistingProduct(t *testing.T) {
	defer gock.Off()
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/boundary-desktop/latest").
		MatchParam("license_class", "oss").
		Reply(200).
		File("testdata/releases.com_boundary-desktop.json")
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Casks/hashicorp-boundary-desktop.rb").
		Reply(200).
		File("testdata/github.com_cask_boundary-desktop.rb")
	oldSupportedRecord := events.SNSEventRecord{
		EventSource: "test",
		SNS: events.SNSEntity{
			Timestamp: time.Now(),
			Message:   `{"product": "boundary-desktop"}`,
			MessageID: "deadbeef",
		},
	}
	err := HandleLambdaEvent(events.SNSEvent{
		Records: []events.SNSEventRecord{oldSupportedRecord},
	})
	assert.Error(t, err, "formula/cask is already latest version")
}

func TestHandleLambdaEventNewProduct(t *testing.T) {
	defer gock.Off()
	// To test "new" since our product list is hard-coded we re-use an existing product but return a 404 instead
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Casks/hashicorp-boundary-desktop.rb").
		Reply(404)
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/boundary-desktop/latest").
		MatchParam("license_class", "oss").
		Reply(200).
		File("testdata/releases.com_boundary-desktop.json")
	gock.New("https://api.github.com").
		Post("/repos/hashicorp/homebrew-tap/dispatches").
		HeaderPresent("Authorization").
		MatchType("json").
		Reply(204).
		BodyString("")

	newSupportedRecord := events.SNSEventRecord{
		EventSource: "test",
		SNS: events.SNSEntity{
			Timestamp: time.Now(),
			Message:   `{"product": "boundary-desktop"}`,
			MessageID: "deadbeef",
		},
	}
	err := HandleLambdaEvent(events.SNSEvent{
		Records: []events.SNSEventRecord{newSupportedRecord},
	})
	assert.NoError(t, err)

	// And we'll also test the Formula bits too, because why not.
	// To test "new" since our product list is hard-coded we re-use an existing product but return a 404 instead
	gock.New("https://raw.githubusercontent.com").
		Get("/hashicorp/homebrew-tap/master/Formula/nomad.rb").
		Reply(404)
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/nomad/latest").
		MatchParam("license_class", "oss").
		Reply(200).
		File("testdata/releases.com_nomad-oss.json")
	gock.New("https://api.github.com").
		Post("/repos/hashicorp/homebrew-tap/dispatches").
		HeaderPresent("Authorization").
		MatchType("json").
		Reply(204).
		BodyString("")
	newSupportedFormulaRecord := events.SNSEventRecord{
		EventSource: "test",
		SNS: events.SNSEntity{
			Timestamp: time.Now(),
			Message:   `{"product": "nomad"}`,
			MessageID: "deadbeef",
		},
	}
	err = HandleLambdaEvent(events.SNSEvent{
		Records: []events.SNSEventRecord{newSupportedFormulaRecord},
	})
	assert.NoError(t, err)
}

func TestGetLatestVersionIgnoresVariants(t *testing.T) {
	defer gock.Off()
	gock.New("https://api.releases.hashicorp.com").
		Get("/v1/releases/vault/latest").
		MatchParam("license_class", "enterprise").
		Reply(200).
		File("testdata/releases.com_vault-enterprise_latest.json")

	gotLatest, err := getLatestVersion("vault-enterprise")

	require.NoError(t, err)
	assert.Equal(t, "1.13.3+ent", *gotLatest)
}

func Test_isProductSupported(t *testing.T) {
	require := require.New(t)
	t.Run("when product is supported", func(t *testing.T) {
		require.True(isProductSupported("vault"))
	})

	t.Run("when product is not supported", func(t *testing.T) {
		require.False(isProductSupported("unknown-product"))
	})
}

func Test_isFormula(t *testing.T) {
	require := require.New(t)
	t.Run("when product is formula only", func(t *testing.T) {
		require.True(isFormula("vault"))
	})

	t.Run("when product is formula and cask", func(t *testing.T) {
		require.True(isFormula("vagrant"))
	})

	t.Run("when product is cask only", func(t *testing.T) {
		require.False(isFormula("boundary-desktop"))
	})
}

func Test_isCask(t *testing.T) {
	require := require.New(t)
	t.Run("when product is formula only", func(t *testing.T) {
		require.False(isCask("vault"))
	})

	t.Run("when product is formula and cask", func(t *testing.T) {
		require.True(isCask("vagrant"))
	})

	t.Run("when product is cask only", func(t *testing.T) {
		require.True(isCask("boundary-desktop"))
	})
}

func TestHandleLambdaEvent(t *testing.T) {
	require := require.New(t)
	successfulTest := "test was succesful"

	t.Run("when product is formula only", func(t *testing.T) {
		t.Run("when versions are different", func(t *testing.T) {
			reader, writer, cleanup := enableLogCapture(t)
			defer cleanup()
			defer gock.Off()
			// Mock all the expected http requests
			generateFormulaMock("nomad").Reply(200).
				BodyString(generateFormulaReply("nomad", "1.3.5"))
			generateReleasesLatestMock("nomad").Reply(200).
				BodyString(generateReleasesReply("nomad", "1.3.6"))
			generateDispatchMock().
				MatchType("json").
				BodyString(`.*"cask":"false".*`). // ensure cask job is not triggered
				Reply(200).
				BodyString(successfulTest)

			require.NoError(HandleLambdaEvent(generateSnsEvent("nomad", "1.3.6")))
			writer.Close()
			result, err := io.ReadAll(reader)
			require.NoError(err)
			require.Contains(string(result), successfulTest)
		})

		t.Run("when versions are the same", func(t *testing.T) {
			defer gock.Off()
			generateFormulaMock("nomad").Reply(200).
				BodyString(generateFormulaReply("nomad", "1.3.5"))
			generateReleasesLatestMock("nomad").Reply(200).
				BodyString(generateReleasesReply("nomad", "1.3.5"))

			err := HandleLambdaEvent(generateSnsEvent("nomad", "1.3.5"))
			require.Error(err)
			require.Contains(err.Error(), "latest version")
		})
	})

	t.Run("when product is cask only", func(t *testing.T) {
		t.Run("when versions are different", func(t *testing.T) {
			reader, writer, cleanup := enableLogCapture(t)
			defer cleanup()
			defer gock.Off()
			generateCaskMock("boundary-desktop").Reply(200).
				BodyString(generateCaskReply("boundary-desktop", "1.1.1"))
			generateReleasesLatestMock("boundary-desktop").Reply(200).
				BodyString(generateReleasesReply("boundary-desktop", "1.1.2"))
			generateDispatchMock().
				MatchType("json").
				BodyString(`.*"cask":"true".*`). // ensure cask job is triggered
				Reply(200).
				BodyString(successfulTest)

			require.NoError(HandleLambdaEvent(generateSnsEvent("boundary-desktop", "1.1.2")))
			writer.Close()
			result, err := io.ReadAll(reader)
			require.NoError(err)
			require.Contains(string(result), successfulTest)
		})

		t.Run("when versions are the same", func(t *testing.T) {
			defer gock.Off()
			generateCaskMock("boundary-desktop").Reply(200).
				BodyString(generateCaskReply("boundary-desktop", "1.1.1"))
			generateReleasesLatestMock("boundary-desktop").Reply(200).
				BodyString(generateReleasesReply("boundary-desktop", "1.1.1"))

			err := HandleLambdaEvent(generateSnsEvent("boundary-desktop", "1.1.2"))
			require.Error(err)
			require.Contains(err.Error(), "latest version")
		})
	})

	t.Run("when product is formula and cask", func(t *testing.T) {
		formulaSuccess := "formula test success"
		caskSuccess := "cask test success"
		t.Run("when versions are different", func(t *testing.T) {
			t.Run("it should trigger workflow twice", func(t *testing.T) {
				reader, writer, cleanup := enableLogCapture(t)
				defer cleanup()
				defer gock.Off()
				generateCaskMock("vagrant").Reply(200).
					BodyString(generateCaskReply("vagrant", "1.0.1"))
				generateReleasesLatestMock("vagrant").Reply(200).
					BodyString(generateReleasesReply("vagrant", "1.0.2"))
				generateDispatchMock().Reply(200).
					BodyString(caskSuccess)
				generateDispatchMock().Reply(200).
					BodyString(formulaSuccess)

				require.NoError(HandleLambdaEvent(generateSnsEvent("vagrant", "1.0.2")))
				writer.Close()
				result, err := io.ReadAll(reader)
				require.NoError(err)
				require.Contains(string(result), caskSuccess)
				require.Contains(string(result), formulaSuccess)
			})

			t.Run("it should trigger cask workflow", func(t *testing.T) {
				reader, writer, cleanup := enableLogCapture(t)
				defer cleanup()
				defer gock.Off()
				generateCaskMock("vagrant").Reply(200).
					BodyString(generateCaskReply("vagrant", "1.0.1"))
				generateReleasesLatestMock("vagrant").Reply(200).
					BodyString(generateReleasesReply("vagrant", "1.0.2"))
				generateDispatchMock().
					MatchType("json").
					BodyString(`.*"cask":"true".*`).
					Reply(200).
					BodyString(caskSuccess)
				generateDispatchMock().
					Reply(200).
					BodyString(formulaSuccess)

				require.NoError(HandleLambdaEvent(generateSnsEvent("vagrant", "1.0.2")))
				writer.Close()
				result, err := io.ReadAll(reader)
				require.NoError(err)
				require.Contains(string(result), caskSuccess)
			})

			t.Run("it should trigger formula workflow", func(t *testing.T) {
				reader, writer, cleanup := enableLogCapture(t)
				defer cleanup()
				defer gock.Off()
				generateCaskMock("vagrant").Reply(200).
					BodyString(generateCaskReply("vagrant", "1.0.1"))
				generateReleasesLatestMock("vagrant").Reply(200).
					BodyString(generateReleasesReply("vagrant", "1.0.2"))
				generateDispatchMock().
					Reply(200).
					BodyString(caskSuccess)
				generateDispatchMock().
					MatchType("json").
					BodyString(`.*"cask":"false".*`).
					Reply(200).
					BodyString(formulaSuccess)

				require.NoError(HandleLambdaEvent(generateSnsEvent("vagrant", "1.0.2")))
				writer.Close()
				result, err := io.ReadAll(reader)
				require.NoError(err)
				require.Contains(string(result), formulaSuccess)
			})
		})

		t.Run("when versions are the same", func(t *testing.T) {
			defer gock.Off()
			generateCaskMock("vagrant").Reply(200).
				BodyString(generateCaskReply("vagrant", "1.0.1"))
			generateReleasesLatestMock("vagrant").Reply(200).
				BodyString(generateReleasesReply("vagrant", "1.0.1"))
			err := HandleLambdaEvent(generateSnsEvent("vagrant", "1.0.2"))
			require.Error(err)
			require.Contains(err.Error(), "latest version")
		})
	})
}

// Captures content written to logger
func enableLogCapture(t *testing.T) (reader io.ReadCloser, writer io.Closer, cleanup func()) {
	t.Helper()
	reader, w, err := os.Pipe()
	if err != nil {
		t.Fatalf("Could not setup stdout capture: %s", err)
	}
	writer = w
	logWriter := log.Writer()
	log.SetOutput(w)
	cleanup = func() {
		log.SetOutput(logWriter)
		reader.Close()
		writer.Close()
	}
	return
}

// Generate simplified formula content for version checking
func generateFormulaReply(product, version string) string {
	return fmt.Sprintf(`desc "%s"\nversion "%s"\n`, product, version)
}

// Generate simplified cask content for version checking
// NOTE: hashicorp- prefix is automatically added to product
func generateCaskReply(product, version string) string {
	// Casks always have "hashicorp-" prefix so add
	product = "hashicorp-" + product
	return fmt.Sprintf(`cask "%s" do\nversion "%s"\nend`, product, version)
}

// Generates the response body for latest from releases api
// NOTE: It only includes the name and version values
func generateReleasesReply(product, version string) string {
	info := map[string]string{
		"name":    product,
		"version": version,
	}
	payload, err := json.Marshal(info)
	if err != nil {
		panic(err)
	}
	return string(payload)
}

// Generates an SNS event message using provided product and version
func generateSnsEvent(product, version string) events.SNSEvent {
	info := map[string]string{
		"product": product,
		"version": version,
	}
	payload, err := json.Marshal(info)
	if err != nil {
		panic(err)
	}

	return events.SNSEvent{
		Records: []events.SNSEventRecord{
			{
				SNS: events.SNSEntity{
					Message: string(payload),
				},
			},
		},
	}
}

// Generates the base mock used when requesting latest version from the releases api
func generateReleasesLatestMock(product string) *gock.Request {
	return gock.New("https://api.releases.hashicorp.com").
		Get(fmt.Sprintf("/v1/releases/%s/latest", product))
}

// Generates the base mock used when requesting formula for version check
func generateFormulaMock(product string) *gock.Request {
	return gock.New("https://raw.githubusercontent.com").
		Get(fmt.Sprintf("/hashicorp/homebrew-tap/master/Formula/%s.rb", product))
}

// Generates the base mock used when requesting cask for version check
// NOTE: hashicorp- prefix is automatically added to product
func generateCaskMock(product string) *gock.Request {
	// Casks always have "hashicorp-" prefix so add
	product = "hashicorp-" + product
	return gock.New("https://raw.githubusercontent.com").
		Get(fmt.Sprintf("/hashicorp/homebrew-tap/master/Casks/%s.rb", product))
}

// Generates the base mock used when sending a repository dispatch notification
func generateDispatchMock() *gock.Request {
	dispatchUrl, err := url.Parse(workflowEndpoint)
	if err != nil {
		panic(err)
	}

	return gock.New(fmt.Sprintf("%s://%s", dispatchUrl.Scheme, dispatchUrl.Host)).
		Post(dispatchUrl.Path)
}
