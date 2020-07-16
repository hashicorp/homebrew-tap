package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/aws/aws-lambda-go/lambda"
)

// ReleaseEvent event body
type ReleaseEvent struct {
	Product string `json:"product"`
	Version string `json:"version"`
	SHA256  string `json:"shasum"`
}

func shouldTriggerWorkflow(product string) bool {
	supportedProducts := []string{"vault", "consul", "nomad"}

	for _, p := range supportedProducts {
		if p == product {
			return true
		}
	}

	return false
}

func triggerGithubWorkflow(event ReleaseEvent) error {
	workflowEndpoint := "https://github.com/hashicorp/homebrew-tap/dispatches"
	postBody := fmt.Sprintf("{\"event_type\": \"version-updated\", \"client_payload\":{\"name\":\"%s\",\"version\":\"%s\",\"sha256\":\"%s\"}}", event.Product, event.Version, event.SHA256)
	resp, err := http.Post(workflowEndpoint, "application/json", bytes.NewBufferString(postBody))
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	fmt.Printf("Github Response: %+v", body)
	return err
}

// HandleLambdaEvent handler function to trigger github workflow
func HandleLambdaEvent(event ReleaseEvent) error {
	fmt.Printf("Received message: %+v", event)

	if shouldTriggerWorkflow(event.Product) {
		err := triggerGithubWorkflow(event)

		return err
	}

	return nil
}

func main() {
	lambda.Start(HandleLambdaEvent)
}
