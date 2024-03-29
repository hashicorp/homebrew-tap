
.PHONY: test
test: build
	go test -v

.PHONY: ci-test
ci-test:
	@go test -json | tparse -follow

.PHONY: mod-download
mod-download:
	go mod download

build: *.go go.* mod-download
	go build

release: *.go go.* mod-download
	@echo "Preparing artifact..."
	@GOOS=linux GOARCH=amd64 go build -trimpath -tags lambda.norpc -o bootstrap
	@touch -d $$(TZ=UTC0 git show --quiet --date='format-local:%Y-%m-%dT%H:%M:%SZ' --format="%cd") bootstrap
	@zip -X lambda.zip bootstrap
	@openssl dgst -sha256 -hex bootstrap lambda.zip
	@echo
	@echo "AWS Lambda CodeSha256:"
	@openssl dgst -sha256 -binary lambda.zip | openssl enc -base64
	@echo
	@echo "To publish, use: aws lambda update-function-code ..."

.PHONY: clean
clean:
	rm -rvf lambda_trigger
	

# Note: These URLs are pinned to the urls used by the test. If updated, please be sure to update the test values too.
.PHONY: testdata
testdata:
	curl --fail --silent 'https://api.releases.hashicorp.com/v1/releases/nomad/1.3.5+ent?license_class=enterprise' | jq --sort-keys > testdata/releases.com_nomad-enterprise.json
	curl --fail --silent 'https://api.releases.hashicorp.com/v1/releases/nomad/1.3.5?license_class=oss' | jq --sort-keys > testdata/releases.com_nomad-oss.json
	curl --fail --silent 'https://api.releases.hashicorp.com/v1/releases/boundary-desktop/1.5.0?license_class=oss' | jq --sort-keys > testdata/releases.com_boundary-oss.json
	curl --fail --silent 'https://api.releases.hashicorp.com/v1/releases/boundary-desktop/1.5.0?license_class=oss' | jq --sort-keys > testdata/releases.com_boundary-desktop.json
	curl --fail --silent 'https://raw.githubusercontent.com/hashicorp/homebrew-tap/a1a4af71310cc99c00259cda7c39a981b66442d4/Formula/nomad.rb' --output testdata/github.com_formula_nomad.rb
	curl --fail --silent 'https://raw.githubusercontent.com/hashicorp/homebrew-tap/a1a4af71310cc99c00259cda7c39a981b66442d4/Formula/nomad-enterprise.rb' --output testdata/github.com_formula_nomad-enterprise.rb
	curl --fail --silent 'https://raw.githubusercontent.com/hashicorp/homebrew-tap/525cf0610587cef5cb6a40f31c8d92f70f335fb4/Casks/hashicorp-boundary-desktop.rb' --output testdata/github.com_cask_boundary-desktop.rb
	curl --fail --silent 'https://api.releases.hashicorp.com/v1/releases/vault/1.13.3+ent.hsm.fips1402?license_class=enterprise' | jq --sort-keys > testdata/releases.com_vault-enterprise_latest.json
