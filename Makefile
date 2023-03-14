
.PHONY: all
all: formula_templater lambda_trigger

#.PHONY: test
test: tools
	echo 'formula_templater\nlambda_trigger' | xargs -I{} $(MAKE) -C util/{} ci-test | tparse -follow

.PHONY: tools
tools:
	go install github.com/mfridman/tparse@v0.12.1

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
	
