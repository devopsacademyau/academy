NAME:=mail2kvanitha
REPO_NAME:=devopsacademy
IMAGE_NAME:=make01
PORT ?= 8090
TAG=$(shell git rev-parse --short HEAD)

.PHONY: build
build: 
	@echo "This image was created by $(NAME), based on the $(TAG)" > index.html ; if [ $$? -eq 0 ]; then \
                                                                                          echo "SUCCESS - index.html created successfully"; ls -l index.html ; \
                                                                                      else \
                                                                                          echo "ERROR - Unable to create index.html file" ; \
                                                                                      fi

	@echo "Creating dynamic index.html file"
	@echo "Building docker image $(IMAGE_NAME):$(TAG)"
	@docker build -t $(IMAGE_NAME):$(TAG) . ; if [ $$? -eq 0 ]; then \
                                                            echo "SUCCESS - Docker image created successfully"; docker image ls |grep ^$(IMAGE_NAME) ; \
                                                         else  \
                                                            echo "ERROR - Unable to create image. Check the Dockerfile for any syntax errors" ; \
                                                         fi
	@rm index.html ;  if [ $$? -eq 0 ]; then  echo "SUCCESS - Removed the index.html file" ; fi

.PHONY: run
run: build
	@echo "Creating Container ..."
	@docker run --name $(IMAGE_NAME) -d -p $(PORT):80 $(IMAGE_NAME):$(TAG) ; if [ $$? -eq 0 ]; then \
                                                                        echo "SUCCESS - Docker Container successfully created and started" ; \
                                                                        docker container ps |grep $IMAGE_NAME ; \
                                                                        echo "INFO - Checking the Webserver" ; \
                                                                        curl http://localhost:$(PORT) ; \
                                                                    else \
                                                                        echo "ERROR - Unable to create Docker container" ; \
                                                                    fi

.PHONY:push
push: build 
	@echo "Tagging the docker image..."
	@docker tag $(IMAGE_NAME):$(TAG) $(NAME)/$(REPO_NAME):$(IMAGE_NAME) ; if [ $$? -eq 0 ]; then \
                                                                                        echo "SUCCESS - Docker image tagged as $(NAME)/$(REPO_NAME):$(IMAGE_NAME) " ; \
                                                                                        docker push $(NAME)/$(REPO_NAME):$(IMAGE_NAME) ; \
                                                                                        echo "SUCCESS - docker imaged pushed to Docker Hub successfully" ; \
                                                                                     else \
                                                                                        echo "ERROR - Either local image doesnt exist or Docker Hub login or Repository details is incorrect" ; \
                                                                                     fi
