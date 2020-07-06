
IMAGE_NAME ?= hsy3418/make1
FILE ?= index.html
PORT ?= 8080
NAME ?= Heaven

.PHONY: build
build: 
	$(eval SHA=$(shell git rev-parse --short HEAD))
	@touch ${FILE}
	@echo "This image was created by your ${NAME} , based on the $(SHA) " > ${FILE}
	docker build -t ${IMAGE_NAME} .

.PHONY: push
push:
	docker push ${IMAGE_NAME}	

.PHONY: run
run:
	docker run -p ${PORT}:80 ${IMAGE_NAME}

