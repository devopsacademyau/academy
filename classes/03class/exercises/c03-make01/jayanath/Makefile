IMAGE=make01
SHA=`git rev-parse --short HEAD`
USER=jayforweb
NAME=Jay
EXPOSE=8080

.PHONY: build
build:
	@echo "========================="
	@echo "Building the docker image"
	@echo "========================="
	echo "This image was created by ${NAME}, based on the ${SHA}." > index.html
	docker build -t ${IMAGE}:${SHA} .

.PHONY: push
push:
	@echo "==============================="
	@echo "Pushing the image to Docker Hub"
	@echo "==============================="
	docker tag ${IMAGE}:${SHA} ${USER}/${IMAGE}:${SHA}
	docker push ${USER}/${IMAGE}:${SHA}

.PHONY: run
run:
	@echo "==============================="
	@echo "Running container on port 8080"
	@echo "==============================="
	docker run --rm -p ${EXPOSE}:80 ${IMAGE}:${SHA}