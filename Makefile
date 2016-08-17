.PHONY: all build

all: build

build: ubuntu-12.04 ubuntu-14.04 ubuntu-15.10 ubuntu-16.04 debian-wheezy debian-jessie

%::
	@docker build -t gcr.io/stacksmith-images/$(word 1, $(subst -, ,$@)):$(word 2, $(subst -, ,$@))-r$(shell cat $(word 1, $(subst -, ,$@))/$(word 2, $(subst -, ,$@))/REVISION) -f $(word 1, $(subst -, ,$@))/$(word 2, $(subst -, ,$@))/Dockerfile .
	@docker build -t gcr.io/stacksmith-images/$(word 1, $(subst -, ,$@))-buildpack:$(word 2, $(subst -, ,$@))-r$(shell cat $(word 1, $(subst -, ,$@))/$(word 2, $(subst -, ,$@))/REVISION) -f $(word 1, $(subst -, ,$@))/$(word 2, $(subst -, ,$@))/buildpack/Dockerfile .
