REGISTRY ?= carloshz4
IMAGE ?= make01
PORT ?= 8081
tag := $(shell git rev-parse --short HEAD)


all: build push run

.PHONY: build
build:
	@echo "<h1>This image was created by Carlos Zambrano, based on the ${tag}</h1>" > index.html
	@docker build -t ${IMAGE}:${tag} .

.PHONY: push
push:
	@echo "Publishing the container as ${REGISTRY}/${IMAGE}:${tag}"
	@docker tag ${IMAGE}:${tag} ${REGISTRY}/${IMAGE}:${tag}
	@docker push ${REGISTRY}/${IMAGE}:${tag}

.PHONY: run
run:
	@echo "Running the container on port ${PORT}..."
	@docker run -d -p ${PORT}:80 ${IMAGE}:${tag}
