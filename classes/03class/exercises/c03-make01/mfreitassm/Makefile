COMMIT_SHA = $(shell git rev-parse --short HEAD) 
NAME = $(shell git config --global user.name) 

.PHONY: build
build:
	@echo "Creating image"
	@echo "This image was created by $(NAME), based on the $(COMMIT_SHA)" > index.html
	@echo "Building docker file"
	docker build -t make01:$(COMMIT_SHA) .

.PHONY: push
push:
	@echo "Pushing image to dockerhub"
	@docker tag make01:$(COMMIT_SHA) mfreitassm/c03-make01:$(COMMIT_SHA)
	docker push mfreitassm/c03-make01:$(COMMIT_SHA)
.PHONY: run
run:
	@echo "Runnig Container"
	docker run -dp 8083:80 make01:$(COMMIT_SHA)
	curl http://localhost:8083

