SHA?=$(shell git rev-parse --short HEAD)
DOCKER_REGISTRY?=zarajoy
IMAGE_NAME?=zarajoy_actions02

login: 
	@echo 'Logging into docker hub'
	docker login --username $(DOCKER_REGISTRY) --password $(DOCKER_PW)
	@echo 'Logged in as $(DOCKER_REGISTRY)'
.PHONY: login



build: 
	@echo 'Building the docker image'
	docker build -t $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(SHA) -f Dockerfile .
	@echo 'Build complete: $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(SHA) '
.PHONY: build


push: 
	@echo 'Pushing $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(SHA) to dockerhub'
	docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(SHA)
	@echo 'Pushed!'
.PHONY: push

docker_all: login build push
.PHONY: docker_all 
