REGISTRY ?= $$(docker info | sed '/Username:/!d;s/.* //' |  sed "s/ //g")
IMAGE ?= make01
TAG ?= $$(git rev-parse --short HEAD)
PORT ?= 80



.PHONY: build
build:
	@echo ${REGISTRY}

	@echo "Building Docker Image ${REGISTRY}/${IMAGE}:${TAG}"
	@docker build -t ${IMAGE}:${TAG} \
		--build-arg REGISTRY=${REGISTRY} \
		--build-arg TAG=${TAG} .

.PHONY: run
run:
	@echo "Running the container on port ${PORT}..."
	@docker run -d -p ${PORT}:80 ${IMAGE}:${TAG}

.PHONY: push
push: 
	@echo "Publishing the container as ${REGISTRY}/${IMAGE}:${TAG} "
	@docker tag ${IMAGE}:${TAG} ${REGISTRY}/${IMAGE}:${TAG}
	@docker push ${REGISTRY}/${IMAGE}:${TAG}