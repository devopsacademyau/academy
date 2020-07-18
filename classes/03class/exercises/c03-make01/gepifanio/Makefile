NAME ?= Guilherme
COMMIT_SHA ?= ${shell git rev-parse --short HEAD}
IMAGE_NAME ?= make01
DOCKER_HUB_USERNAME ?= guiepifanio
PORT_NUMBER ?= 80

all: build push run clean_up

.PHONY: all

build:
	echo "This image was created by ${NAME} based on the ${COMMIT_SHA}" > index.html
	docker build -t ${IMAGE_NAME}:${COMMIT_SHA} .
	docker tag ${IMAGE_NAME}:${COMMIT_SHA} ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${COMMIT_SHA}

push:
	docker push ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${COMMIT_SHA}

run:
	docker run -p ${PORT_NUMBER} -d ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${COMMIT_SHA}

clean_up:
	docker container prune -f
	docker image rm ${IMAGE_NAME}:${COMMIT_SHA}
	docker image rm ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${COMMIT_SHA}
