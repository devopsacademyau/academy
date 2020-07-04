VERSION  := $(shell git rev-parse --short HEAD)
USERNAME := $(shell git config user.name)

.PHONY: all
all: build push run

.PHONY: build
build:
	docker build \
		-t c05-make01:$(VERSION) \
		--build-arg \
			index_content="This image was created by $(USERNAME), based on the short commit sha $(VERSION)" .
	docker tag c05-make01:$(VERSION) luizfdsilva/c05-make01:$(VERSION)

.PHONY: push
push:
	docker push luizfdsilva/c05-make01:$(VERSION)

.PHONY: run
run:
	docker run -p 8080:80 -it c05-make01:$(VERSION)
