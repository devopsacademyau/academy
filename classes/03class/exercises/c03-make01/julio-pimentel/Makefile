NAME = Julio 

SHA := $(shell git rev-parse --short HEAD)
IMAGE = c03-make01
DHUSER = juliopimentel
PORT = 8081

.PHONY: build push run

build:
	@echo "This image was created by $(NAME), based on the short commit $(SHA)" >> index.html
	@docker build -f Dockerfile -t ${DHUSER}/${IMAGE}:${SHA} . 


push:
	@echo "Push Docker image to ${DHUSER} DockerHub account" 
	@docker push ${DHUSER}/${IMAGE}:${SHA}


run:
	@echo "Run Docker image locally"
	@docker run -dit --rm -p $(PORT):80 ${DHUSER}/${IMAGE}:${SHA}
