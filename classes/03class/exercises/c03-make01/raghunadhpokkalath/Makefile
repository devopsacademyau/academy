SHA1=$(shell git rev-parse --short HEAD)
IMAGE_NAME="make01:${SHA1}"
PUSH_REGISTRY=raghunadhp

.PHONY: build
build:
	@echo "@@@ Start Docker Build  for ${SHA1} @@@"
	@echo "This image was created by Raghunadh Pokkalath, based on the ${SHA1}" > index.html
	docker build -t ${IMAGE_NAME} -f Dockerfile .
	@echo "@@@ Finish Docker Build  for  ${SHA1} @@@"
.PHONY: push	
push:
	@echo "@@@ Start Docker Push for ${SHA1} @@@@"
	docker tag ${IMAGE_NAME} ${PUSH_REGISTRY}/${IMAGE_NAME}
	docker push ${PUSH_REGISTRY}/${IMAGE_NAME}
	@echo "@@@ Finish Docker Push for ${SHA1} @@@"
.PHONY: run
run:
	@echo "@@@ Start Docker on  for ${APP_PORT} @@@"
	docker run -d -p ${APP_PORT}:80 ${IMAGE_NAME} 
	@echo "@@@ Verify the instance @@@"
	curl http://localhost:${APP_PORT}