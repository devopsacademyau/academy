export USER := Fernando
export HASH := $(shell git rev-parse --short HEAD)
export CONTAINER := make01:${HASH}

.PHONY: build
build:
	@echo "This image was create by ${USER}, based on the ${HASH}" > index.html
	docker build -t ${CONTAINER} .

.PHONY: push
push:
	docker tag ${CONTAINER} fernandobraga/${CONTAINER}
	docker push fernandobraga/${CONTAINER}

.PHONY: run
run:
	@echo "Please enter a port number to bind to this container: "; \
	read PORT; \
	docker run -d -p $$PORT:80 fernandobraga/${CONTAINER}