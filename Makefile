#!/bin/bash

SHELL             = /bin/bash
IMAGE_PREFIX     ?= igolaizola
REPO_NAME		 ?= chromote
COMMIT_SHORT     ?= $(shell git rev-parse --verify --short HEAD)
VERSION          ?= $(COMMIT_SHORT)

# Build the docker image
.PHONY: docker-build
docker-build:
	docker build  -t $(IMAGE_PREFIX)/$(REPO_NAME):$(VERSION) .; \
	if [ $$? -ne 0 ]; then \
		exit 1; \
	fi

# Push the docker image
.PHONY: docker-push
docker-push:
	docker push $(IMAGE_PREFIX)/$(REPO_NAME):$(VERSION); \
	if [ $$? -ne 0 ]; then \
		exit 1; \
	fi
