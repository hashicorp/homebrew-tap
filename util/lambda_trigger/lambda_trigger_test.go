package main

import (
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
