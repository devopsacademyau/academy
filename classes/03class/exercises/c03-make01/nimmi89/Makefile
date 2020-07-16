
TAG = $(shell git rev-parse --short HEAD) 
PORT = 80
NAME = nimmi

# DOCKER TASKS
.PHONY: build
build: ## Build the container
	@echo 'CREATING INDEX.HTML WITH SHA TAG $(TAG)'
	echo "This image was created by $(NAME), based on the short commit sha $(TAG)" > index.html
	@echo 'BUILDING THE IMAGE'
	docker build -t make01:$(TAG) .

.PHONY: run
run: ## Run container on port provided dynamically
	@echo 'RUNNING THE CONTAINER ON GIVEN PORT'
	docker run -d -p $(PORT):80 make01:$(TAG)
	@echo 'CHECKING IF WEB SERVER IS RUNNING on $(PORT)'
	@echo `curl http://localhost:$(PORT)`


.PHONY: push
push: ## Publish the image to docker hub
	@echo 'PUBLISHING THE IMAGE TO DOCKER HUB'
	docker tag make01:$(TAG) netizen89/make01:$(TAG)
	docker push netizen89/make01:$(TAG)
