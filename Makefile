IMAGE_FLAVORS := ubuntu/12.04 ubuntu/14.04 ubuntu/15.10 ubuntu/16.04 debian/wheezy minideb/jessie

.PHONY: all build

all: build

build:
	@for f in $(IMAGE_FLAVORS); do \
		distro=$$(echo "$$f" | cut -d'/' -f1) ; \
		release=$$(echo "$$f" | cut -d'/' -f2) ; \
		revision=$$(cat $$distro/$$release/REVISION) ; \
		if [ $(DEV_BUILD) ]; then revision=DEV; fi ; \
		docker build --rm=false -t gcr.io/$(GCLOUD_PROJECT)/$$distro:$$release-r$$revision -f $$distro/$$release/Dockerfile . && \
		echo "FROM gcr.io/$(GCLOUD_PROJECT)/$$distro:$$release-r$$revision\n$$(cat $$distro/$$release/buildpack/Dockerfile)" | \
		docker build --rm=false -t gcr.io/$(GCLOUD_PROJECT)/$$distro-buildpack:$$release-r$$revision - ; \
	done
