
#vars
SHORTSHA := $(shell git rev-parse --short HEAD)
IMAGEFULLNAME=conorcr/make01:${SHORTSHA}

.PHONY: build push run 

build:
		@echo "This image was created by Conor, based on the ${SHORTSHA}" >> index.html
	    @docker build -t ${IMAGEFULLNAME} .

push:
	    @docker image push ${IMAGEFULLNAME}

run:
		@docker run -dit -p ${HOSTPORT}:80 ${IMAGEFULLNAME}

