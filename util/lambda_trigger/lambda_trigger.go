package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"regexp"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// ReleaseEvent event body
type ReleaseEvent struct {
	Product string `json:"product"`
	Version string `json:"version"`
	Cask    bool   `json:"cask"`
}

var errBrewVersionNotFound = errors.New("no brew version found")

func isProductSupported(product string) bool {
	supportedProducts := []string{
		"vault",
		"vault-enterprise",
		"consul",
		"consul-enterprise",
		"consul-aws",
		"consul-dataplane",
		"consul-esm",
		"consul-k8s",
		"consul-template",
		"consul-terraform-sync",
		"envconsul",
		"hc-install",
		"hcdiag",
		"levant",
		"nomad",
		"nomad-enterprise",
		"nomad-pack",
		"terraform",
		"terraform-ls",
		"packer",
		"boundary",
		"boundary-enterprise",
		"waypoint",
		"boundary-desktop",
		"sentinel",
		"vagrant",
		"vlt",
	}

	for _, p := range supportedProducts {
		if p == product {
			return true
		}
	}

	return false
}

func isCask(product string) bool {
	casks := []string{"boundary-desktop", "vagrant"}

	for _, p := range casks {
		if p == product {
			return true
		}
	}

	return false
}

func getFormulaVersion(product string) (string, error) {
	return getBrewVersion(product, "Formula")
}

func getCaskVersion(product string) (string, error) {
	namespaced := fmt.Sprintf("hashicorp-%s", product)
	return getBrewVersion(namespaced, "Casks")
}

func getBrewVersion(product string, brewType string) (string, error) {
	formulaURL := fmt.Sprintf("https://raw.githubusercontent.com/hashicorp/homebrew-tap/master/%s/%s.rb", brewType, product)
	resp, err := http.Get(formulaURL)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()
	if resp.StatusCode == http.StatusNotFound {
		// This formula|cask may be new. We'll assume so.
		return "", errBrewVersionNotFound
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	re := regexp.MustCompile(`version "(.+)"`)
	matched := re.FindStringSubmatch(string(body))
	if matched == nil || len(matched) < 2 {
		return "", errors.New("No version found in formula")
	}
	return matched[1], nil
}

func triggerGithubWorkflow(event *ReleaseEvent) error {
	githubToken := os.Getenv("GITHUB_TOKEN")
	// Create dispatch event https://docs.github.com/en/rest/reference/repos#create-a-repository-dispatch-event
	workflowEndpoint := "https://api.github.com/repos/hashicorp/homebrew-tap/dispatches"
	postBody := fmt.Sprintf("{\"event_type\": \"version-updated\", \"client_payload\":{\"name\":\"%s\",\"version\":\"%s\",\"cask\":\"%t\"}}", event.Product, event.Version, event.Cask)
	log.Printf("POSTing to Github: %s", postBody)

	httpClient := &http.Client{}
	req, err := http.NewRequest("POST", workflowEndpoint, bytes.NewBufferString(postBody))
	if err != nil {
		return err
	}
	req.Header.Add("Content-Type", "application/json")
	req.Header.Add("Authorization", fmt.Sprintf("Bearer %s", githubToken))
	resp, err := httpClient.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	body, err := io.ReadAll(resp.Body)
	log.Printf("Github Response: %+v", body)
	return err
}

// HandleLambdaEvent handler function to trigger github workflow
func HandleLambdaEvent(snsEvent events.SNSEvent) error {
	for _, record := range snsEvent.Records {
		snsRecord := record.SNS
		log.Printf("[%s %s] Message = %s", record.EventSource, snsRecord.Timestamp, snsRecord.Message)
		message := record.SNS.Message

		// Parse message to ReleaseEvent type
		event := &ReleaseEvent{}
		err := json.Unmarshal([]byte(message), event)
		if err != nil {
			return err
		}

		if isProductSupported(event.Product) {
			version, err := getLatestVersion(event.Product)
			if err != nil || version == nil {
				return err
			}
			log.Printf("Latest version is %s", *version)
			event.Version = *version
			oldVersion := ""
			event.Cask = isCask(event.Product)

			if event.Cask {
				oldVersion, err = getCaskVersion(event.Product)
				if err != nil && err != errBrewVersionNotFound {
					return err
				}
			} else {
				oldVersion, err = getFormulaVersion(event.Product)
				if err != nil && err != errBrewVersionNotFound {
					return err
				}
			}

			if oldVersion != "" {
				log.Printf("Current formula/cask version is %s", oldVersion)
			} else {
				log.Printf("No previous version found, assuming new formula/cask")
			}

			if event.Version == oldVersion {
				return errors.New("formula/cask is already latest version")
			}

			err = triggerGithubWorkflow(event)

			return err
		}
	}

	return nil
}

func main() {
	lambda.Start(HandleLambdaEvent)
}
