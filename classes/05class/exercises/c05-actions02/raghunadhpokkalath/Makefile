SHA=$(shell git rev-parse --short HEAD)
DOCKER_USER=raghunadhp
.PHONY: build
build:
	docker build -t  ${DOCKER_USER}/my-image:${SHA} .
.PHONY: push
push:
	docker login --username ${DOCKER_USER}  -p ${DOCKER_PAT}
	#0194da5c-e466-4e7f-970f-bed28f7fa39a
	docker push raghunadhp/my-image:${SHA}