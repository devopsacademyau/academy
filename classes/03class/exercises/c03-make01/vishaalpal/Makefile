# Defining variables. 
scsha ?= $(shell git rev-parse --short HEAD)
fname ?= Vishaal
lname ?= Pal
img_name ?= make01
dockerhub_user ?= vee94
dockerhub_repo ?= vishaalpal-docker-images
local_port ?= 8081
container_port ?= 80
container_name ?= c03-make01

# This target builds the docker image locally. 
.PHONY: build
build:
	@echo "\nBuilding docker image...\n"
	echo "This image was created by ${fname} ${lname}, based on the ${scsha}." > index.html
	docker build -t ${img_name}:${scsha} .

# This target tags and pushes the docker image to your dockerhub repository. 
.PHONY: push
push:
	@echo "\nPushing image to your dockerhub account...\n"
	docker tag ${img_name}:${scsha} ${dockerhub_user}/${dockerhub_repo}:${img_name}
	docker push ${dockerhub_user}/${dockerhub_repo}:${img_name}

# This target runs a container from the local docker image.
.PHONY: run
run:
	@echo "\nLaunching container: ${container_name}. Access this container at http://localhost:${local_port}\n"
	docker run -d --name ${container_name} -p ${local_port}:${container_port} ${img_name}:${scsha}
	@echo "\nPrinting curl output from http://localhost:${local_port} below\n"
	curl http://localhost:${local_port}
