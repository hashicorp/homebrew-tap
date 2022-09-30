package main

import (
	"bytes"
	"errors"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"regexp"

	"encoding/json"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// ReleaseEvent event body
type ReleaseEvent struct {
	Product string `json:"product"`
	Version string `json:"version"`
	Cask    bool   `json:"cask"`
}

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
		"hcdiag",
		"levant",
		"nomad",
		"nomad-enterprise",
		"nomad-pack",
		"terraform",
		"terraform-ls",
		"packer",
		"boundary",
		"waypoint",
		"boundary-desktop",
		"sentinel",
	}

	for _, p := range supportedProducts {
		if p == product {
			return true
		}
	}

	return false
}

func isCask(product string) bool {
	casks := []string{"boundary-desktop"}

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
	body, err := ioutil.ReadAll(resp.Body)
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
	fmt.Printf("POSTing to Github: %s\n", postBody)

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
	body, err := ioutil.ReadAll(resp.Body)
	fmt.Printf("Github Response: %+v", body)
	return err
}

// HandleLambdaEvent handler function to trigger github workflow
func HandleLambdaEvent(snsEvent events.SNSEvent) error {
	for _, record := range snsEvent.Records {
		snsRecord := record.SNS
		fmt.Printf("[%s %s] Message = %s \n", record.EventSource, snsRecord.Timestamp, snsRecord.Message)
		message := record.SNS.Message

		// Parse message to ReleaseEvent type
		event := &ReleaseEvent{}
		err := json.Unmarshal([]byte(message), event)
		if err != nil {
			return err
		}

		if isProductSupported(event.Product) {
			version, err := getLatestVersion(event.Product)
			if err != nil {
				return err
			}
			fmt.Printf("Latest version is %s\n", version)
			event.Version = version.Version
			oldVersion := ""
			event.Cask = isCask(event.Product)

			if event.Cask {
				oldVersion, err = getCaskVersion(event.Product)
				if err != nil {
					return err
				}
			} else {
				oldVersion, err = getFormulaVersion(event.Product)
				if err != nil {
					return err
				}
			}

			fmt.Printf("Current formula/cask version is %s\n", oldVersion)

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
