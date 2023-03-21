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
	
