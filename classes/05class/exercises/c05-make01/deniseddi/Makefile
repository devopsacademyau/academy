# You have to define the values in {} or ()
NAME ?= Denise
SHA ?= ${shell git rev-parse --short HEAD}

all: build push run 

.PHONY: all

build:
	echo "This image was created by ${NAME} based on the ${SHA}" > index.html
	docker build -t make01:${SHA} .

push:
	docker tag make01:${SHA} portoddi/make01:${SHA}
	docker push portoddi/make01:${SHA}

run:
	docker run -p 80 -d portoddi/make01:${SHA}