COMMIT_SHA ?= $(shell git rev-parse --short HEAD)
AUTHOR ?= Alan Lima
DOCKER_REPO ?= alanrlima
IMAGE_NAME ?= make01

.PHONY: build
build:
	@echo "  🚀 Creating index.html"
	@echo "This image was created by '$(AUTHOR)', based on the '${COMMIT_SHA}'" >> index.html
	@echo "  💪 Building image $(IMAGE_NAME):${COMMIT_SHA}"
	docker build -t $(IMAGE_NAME):${COMMIT_SHA} .
	@echo "  ❌ Deleting index.html"
	@rm index.html
	@echo "  ✅ All done"

.PHONY: run
run:
	@echo " 🏃‍♂️ Run boy run... Ops running the image on port ${PORT} 🙄"
	docker run -dp ${PORT}:80 $(IMAGE_NAME):$(COMMIT_SHA)
	@echo " ✅ The server is running under 🔥🔥🔥🔥🔥 "
	curl http://localhost:$(PORT)

.PHONY: push
push: 
	@echo " 🚀🚀 Pushing image to the Space 🌌🌌 ... Ops to Docker Hub 🐳"
	@docker tag $(IMAGE_NAME):$(COMMIT_SHA) $(DOCKER_REPO)/$(IMAGE_NAME):$(COMMIT_SHA)
	docker push $(DOCKER_REPO)/$(IMAGE_NAME):$(COMMIT_SHA)
	@echo "  ✅ All done"

.PHONY: commit_hash
commit_hash:
	@git rev-parse --short HEAD

	