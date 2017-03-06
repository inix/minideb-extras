IMAGE_FLAVORS := jessie
GCLOUD_PROJECT := stacksmith-images

.PHONY: all build cache push

all: build

build:
	IMAGE_FLAVORS=$(IMAGE_FLAVORS) DEV_BUILD=$(DEV_BUILD) ./buildall

push: build
	IMAGE_FLAVORS=$(IMAGE_FLAVORS) DEV_BUILD=$(DEV_BUILD) ./pushall
