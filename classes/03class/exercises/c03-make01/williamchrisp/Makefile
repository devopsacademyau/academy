NAME = Will
SHA = $(shell git rev-parse --short HEAD)
PORT ?= 8080

.PHONE: all
all: build push run

.PHONY: build
build:
	@echo "Building Image"
	docker build -f ./Dockerfile . -t make01:$(SHA)
	@echo "<h1>This image was created by $(NAME), based on the $(SHA)</h1>" > index.html

.PHONY: push
push:
	@echo "Pushing Image to dockerhub"
	docker tag make01:$(SHA) confide/make01:$(SHA)
	docker push confide/make01:$(SHA)

.PHONY: run
run:
	@echo "Running Image"
	docker run -p $(PORT):80 make01:$(SHA)