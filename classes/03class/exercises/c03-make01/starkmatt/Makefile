###Name Var
NAME = Matt
###SHA Var
SHA = $(shell git rev-parse --short HEAD)

build:
	echo This image was created by $(NAME), based on $(SHA) > index.html
	docker build -t make01:$(SHA) . 
run:
	docker run -t -d make01:$(SHA) /bin/sh
push:
	docker tag make01:$(SHA) starkmatt/make01:$(SHA)
	docker push starkmatt/make01:$(SHA)

