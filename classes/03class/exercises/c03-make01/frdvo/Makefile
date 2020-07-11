MY_NAME ?= Fernando Rolnik
TAG ?= $(shell git rev-parse --short HEAD)
CR_LOGIN ?= frdvo
C_NAME ?= make01

.PHONY: build
build:
	@echo "\033[1;33mGetting the short commit sha and saving on index.html\033[0m"
	@echo "This image was created by ${MY_NAME}, based on the short commit ${TAG}" > index.html
	@echo "\033[1;33mBuilding container...\033[0m"
	docker build --tag ${CR_LOGIN}/${C_NAME}:${TAG} .
	@echo "\033[1;33mCheck below your built container\033[0m"
	@docker image ls ${CR_LOGIN}/${C_NAME}:${TAG}
	@echo "\033[1;33mYour container is good to go!\033[1;32m make push\033[1;33m it!\033[0m"
	@echo "\033[43mMade with WSL2🐧💕🐳\033[0m"


.PHONY: push
push:
	@echo "\033[1;33mPushing the container to Docker Hub\033[0m"
	docker push ${CR_LOGIN}/${C_NAME}:${TAG}
	@echo "\033[43mMade with WSL2🐧💕🐳\033[0m"

.PHONY: run
run:
	@echo "\033[1;33mLazy container runner to choose a port use\033[1;32m make run p=<Port Number>\033[0m\033[1;33m otherwise it will run on port 80\033[0m"
	docker run --publish ${p}:80 ${CR_LOGIN}/${C_NAME}:${TAG}