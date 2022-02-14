SHA = $(shell git rev-parse --short HEAD)
Image_Name = "make01:${SHA}"
Name = "Ravi Senevirathne"
Docker_Hub = "ravisenevirathne"
PORT ?= 8000

.PHONY: build
build:
	@echo "Building the container based on ${SHA}"
	@echo "This image was created by ${Name}, based on the ${SHA}" > index.html
	docker build -t ${Image_Name} -f Dockerfile .

.PHONY: push
push:
	@echo "Pushing container to docker hub"
	docker tag ${Image_Name} ${Docker_Hub}/${Image_Name}
	docker push ${Docker_Hub}/${Image_Name}

.PHONY: run
run: 
	echo "Running container"
	docker run -d -p ${PORT}:80 ${Image_Name}
	echo "Checking with Curl"
	curl http://localhost:${PORT}