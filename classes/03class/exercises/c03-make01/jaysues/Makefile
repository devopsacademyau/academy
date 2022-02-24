NAME=jaysues
IMAGE=make01
SHA=$(shell git rev-parse --short HEAD)
DOCKERNAME=jaysuesdocker
PORT=80

.PHONY: build
build:
	@echo "Building the Docker image."
	echo "This image has been created by $(NAME), based on the following SHA: $(SHA)" > index.html
	docker build -t $(IMAGE):$(SHA) .

.PHONY: push
push:
	@echo "Tagging and pushing the image to DockerHub."
	docker tag $(IMAGE):$(SHA) $(DOCKERNAME)/$(IMAGE):$(SHA)
	docker push $(DOCKERNAME)/$(IMAGE):$(SHA)

.PHONY: run
run:
	@echo "Run the container on Port $(PORT)"
	docker run -d -p $(PORT):$(PORT) $(DOCKERNAME)/$(IMAGE):$(SHA)
	@echo "to test the container is running: "
	curl http://localhost:$(PORT)