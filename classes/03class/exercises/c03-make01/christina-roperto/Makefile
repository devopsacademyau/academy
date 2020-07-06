NAME = christina

SHA := $(shell git rev-parse --short HEAD)

.PHONY: build push run

build:
	@echo "build the image and tag it with the right value"
	@echo "<h1 style='font-size:14px'>This image was created by $(NAME), based on the short commit $(SHA)</h1>" >> index.html
	docker build -t c05-make01:$(SHA) .


push:
	@echo "push the image to your DockerHub account"
	docker tag c05-make01:${SHA} christinaroperto/devopsacademy-c05-make01:$(SHA)
	docker push christinaroperto/devopsacademy-c05-make01:$(SHA)


run:
	@echo "This will run the docker image locally"
	docker run -it --rm -p $(PORT):80 c05-make01:${SHA}