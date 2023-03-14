.PHONY: test
test: build
	go test -v

.PHONY: ci-test
ci-test:
	@go test -json

build: *.go go.*
	go build

.PHONY: clean
clean:
	rm -rvf formula_templater
	
