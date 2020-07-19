CREATED_BY ?= Fabio Pereira
DOCKER_HUB ?= facp

SHORT_COMMIT_SHA ?= $(shell git rev-parse --short HEAD)

IMAGE_NAME ?= make01
PORT ?= 8081


.PHONY: build
build:
	@echo "This image was created by '$(CREATED_BY)', based on the '$(SHORT_COMMIT_SHA)'" >> index.html
	docker build -t $(IMAGE_NAME):$(SHORT_COMMIT_SHA) .
	@rm index.html

.PHONY: run
run:
	docker run -dp $(PORT):80 $(IMAGE_NAME):$(SHORT_COMMIT_SHA)
	curl http://localhost:$(PORT)

.PHONY: push
push:
	docker tag $(IMAGE_NAME):$(SHORT_COMMIT_SHA) $(DOCKER_HUB)/$(IMAGE_NAME):$(SHORT_COMMIT_SHA)
	docker push $(DOCKER_HUB)/$(IMAGE_NAME):$(SHORT_COMMIT_SHA)
