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

.PHONY: clean
clean:
	rm -rvf formula_templater
	

# Note: These URLs are pinned to the urls used by the test. If updated, please be sure to update the test values too.
.PHONY: testdata
testdata:
	curl --fail --silent 'https://raw.githubusercontent.com/hashicorp/homebrew-tap/105fae955b81ad8d864b511a3875911c66a58c29/Formula/consul.rb' --output testdata/consul.rb
	curl --fail --silent 'https://raw.githubusercontent.com/hashicorp/homebrew-tap/105fae955b81ad8d864b511a3875911c66a58c29/Formula/consul-enterprise.rb' --output testdata/consul-enterprise.rb
