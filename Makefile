.PHONY: all
all: formula_templater lambda_trigger

#.PHONY: test
test-all: ci-test-formula_templater ci-test-lambda_trigger

.PHONY: tools
tools:
	go install github.com/mfridman/tparse@v0.12.1

.PHONY: ci-test-formula_templater
ci-test-formula_templater: tools
	$(MAKE) -C util/formula_templater mod-download
	$(MAKE) -C util/formula_templater ci-test

.PHONY: ci-test-lambda_trigger
ci-test-lambda_trigger: tools
	$(MAKE) -C util/lambda_trigger mod-download
	$(MAKE) -C util/lambda_trigger ci-test

.PHONY: formula_templater
formula_templater:
	$(MAKE) -C util/formula_templater build

.PHONY: lambda_trigger
lambda_trigger: 
	$(MAKE) -C util/lambda_trigger build

.PHONY: clean
clean:
	rm -rvf bin
	$(MAKE) -C util/lambda_trigger $@
	$(MAKE) -C util/formula_templater $@
	
