IMAGE_NAME ?= make01
CREATED_BY ?= Tim
VERSION := $(shell git rev-parse --short HEAD)
DOCKERHUB ?= obrientimothya
PORT ?= 3000

build: 
	echo "This image was created by $(CREATED_BY), based on the short commit sha $(VERSION)" > index.html
	docker build -t $(DOCKERHUB)/$(IMAGE_NAME):$(VERSION) .
PHONY: build

push:
	docker push $(DOCKERHUB)/$(IMAGE_NAME):$(VERSION)
PHONY: push

run:
	docker run -it -p $(PORT):80/tcp $(DOCKERHUB)/$(IMAGE_NAME):$(VERSION)
PHONY: run
