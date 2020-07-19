NAME=zarajoy
IMAGE=make01
SHA=$(shell git rev-parse --short HEAD)
DOCKERNAME=zarajoy
PORT=80

.PHONY: build
build:
	@echo "Building the docker image"
	echo "This image was created by $(NAME), based on the $(SHA)" > index.html
	docker build -t $(IMAGE):$(SHA) .

.PHONY: push
push:
	@echo "Tag and Push image to dockerhub"
	docker tag $(IMAGE):$(SHA) $(DOCKERNAME)/$(IMAGE):$(SHA)
	docker push $(DOCKERNAME)/$(IMAGE):$(SHA)

.PHONY: run
run:
	@echo "Run the container on Port 8080"
	docker run -d -p $(PORT):80 $(DOCKERNAME)/$(IMAGE):$(SHA)
	@echo "test the container is running"
	curl http://localhost:$(PORT)
