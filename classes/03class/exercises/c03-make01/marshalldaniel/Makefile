NAME ?= Daniel
SCSHA ?= $(shell git rev-parse --short HEAD)
IMAGE_NAME ?= make01
DOCKERHUB_USER ?= marshalldaniel
HOST_PORT ?= 8000
CONTAINER_PORT ?= 80

all: build push run

.PHONY: build
build:
	@echo "Creating image."
	@echo "This image was created by ${NAME}, based on the ${SCSHA}" > index.html
	docker build -t ${IMAGE_NAME}:${SCSHA} .

.PHONY: push
push:
	@echo "Tagging and pushing image."
	docker tag ${IMAGE_NAME}:${SCSHA} ${DOCKERHUB_USER}/${IMAGE_NAME}:${SCSHA}
	docker push ${DOCKERHUB_USER}/${IMAGE_NAME}:${SCSHA}

.PHONY: run
run:
	@echo "Running container."
	docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}:${SCSHA}