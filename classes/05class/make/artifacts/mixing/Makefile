STAGE ?= dev
CONFIG1 ?= true
CONFIG2 ?= true
CONFIG3 ?= false
CONFIG4 ?= false
REGISTRY ?= myregistry
IMAGE ?= webserver
TAG ?= test

.PHONY: say_helloworld
build:
	@echo "Build the container..."
	docker build -t ${IMAGE}:${TAG} .

.PHONY: run
run:
	@echo "Running the container on port 8081..."
	@docker run -d -p 8081:80 ${IMAGE}:${TAG} \
		-e STAGE=${STAGE} \
		-e CONFIG1=${CONFIG1} \
		-e CONFIG2=${CONFIG2} \
		-e CONFIG3=${CONFIG3} \
		-e CONFIG4=${CONFIG4}

.PHONY: publish
publish: 
	@echo "Publishing the container as ${REGISTRY}/${IMAGE}:final "
	@docker tag ${IMAGE}:${TAG} ${REGISTRY}/${IMAGE}:final
	@docker push ${REGISTRY}/${IMAGE}:final

.PHONY: clean
clean:
	@echo "Removing containers and images"
	@docker container prune
	@docker image rm ${REGISTRY}/${IMAGE}:final
	@docker image rm ${IMAGE}:${TAG}