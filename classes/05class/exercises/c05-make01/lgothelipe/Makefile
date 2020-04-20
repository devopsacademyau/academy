export NAME ?= Lucas
export SHA ?= $(shell git rev-parse --short HEAD)

.PHONY: build push run

build:
    echo \<h1\>This image was created by $(NAME), based on the $(SHA)\<\/h1\> > index.html
    docker build -t make01:$(SHA) .

push:
    docker tag make01:$(SHA) lgothelipe/make01:$(SHA)
    docker push lgothelipe/make01:$(SHA)

run:
    docker run -p :80 make01:$(SHA)