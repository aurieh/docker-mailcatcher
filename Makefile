DOCKER ?= docker
TAG ?= localhost/mailcatcher:latest

.PHONY: docker
docker:
	$(DOCKER) build -t $(TAG) .
