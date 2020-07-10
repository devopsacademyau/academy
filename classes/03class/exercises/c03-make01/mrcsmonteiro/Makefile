SHELL := /bin/bash
IMAGE=make01
SHA=`git rev-parse --short HEAD`
DHUSER=mrcsmonteiro
NAME=Marcos

.PHONY: build
build:
	@echo
	@echo "################################"
	@echo "# Building Docker Container... #"
	@echo "################################"
	@echo
	@echo "This image was created by ${NAME}, based on the ${SHA}." > index.html
	@echo "> docker build -t ${DHUSER}/${IMAGE}:${SHA} ."
	@echo
	@docker build -t ${DHUSER}/${IMAGE}:${SHA} .
	@ rm index.html
	@echo

.PHONY: push
push:
	@echo
	@echo "##################################"
	@echo "# Pushing Image to Docker Hub... #"
	@echo "##################################"
	@echo
	@echo "> docker push ${DHUSER}/${IMAGE}:${SHA}"
	@echo
	@docker push ${DHUSER}/${IMAGE}:${SHA}
	@echo

.PHONY: run
run:
	@echo
	@echo "###############################"
	@echo "# Running Docker Container... #"
	@echo "###############################"
	@echo
	@echo "> docker run -d -p 80 ${DHUSER}/${IMAGE}:${SHA}"
	@echo
	@docker run -d -p 80 ${DHUSER}/${IMAGE}:${SHA}
	@echo

.PHONY: cleanup
cleanup:
	@echo
	@echo "############################"
	@echo "# Cleaning up Containers.. #"
	@echo "############################"
	@echo
	@echo "> docker container stop `docker ps -a -q`"
	@echo
	@docker container stop `docker ps -a -q`
	@echo
	@echo "> docker container rm `docker ps -a -q`"
	@echo
	@docker container rm `docker ps -a -q`
	@echo
	@echo "> docker image rmi -f `docker images -q`"
	@echo
	@docker image rmi -f `docker images -q`
	@echo
