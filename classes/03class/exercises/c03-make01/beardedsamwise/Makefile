SHA = $(shell git rev-parse --short HEAD)
PORT ?= 8000

.PHONY: build
build:
	@echo "BUILDING DOCKER IMAGE"
	@echo $(SHA) > index.html
	@docker build -t make01:$(SHA) .

.PHONY: push
push:
	@echo "PUSHING DOCKER IMAGE TO DOCKER HUB"
	@docker tag make01:$(SHA) beardedsamwise/c03-make01:$(SHA)
	@docker push beardedsamwise/c03-make01:$(SHA)

.PHONE: run
run:
	@echo "RUNNING DOCKER IMAGE ON PORT $(PORT)"
	@docker run -it -p $(PORT):80 make01:$(SHA)