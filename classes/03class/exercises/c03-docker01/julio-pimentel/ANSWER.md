# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
# 1. Create an EC2 instance with Amazon Linux 2, connect to it, and update Docker 
Source: https://docs.aws.amazon.com/AmazonECS/latest/userguide/create-container-image.html#create-container-image-install-docker

# 2. Create a Dockerfile 

touch Dockerfile 
nano Dockerfile 

FROM alpine:latest
COPY --from=hashicorp/terraform:0.12.20 /bin/terraform /bin/
RUN apk update
CMD ["terraform", "-v"]

# 3. Create Docker Image 

docker build -t da-terraform:c03-docker-e01 .

```

- Command to run the image and its output.:
```
# 4. Run Docker image 
$ docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

# 5. Validate Docker image size 
$ docker images
REPOSITORY            TAG              IMAGE ID       CREATED          SIZE
da-terraform          c03-docker-e01   378414419cb5   26 seconds ago   58.4MB
alpine                latest           9c6f07244728   8 days ago       5.54MB
alpine                3.9.5            82f67be598eb   2 years ago      5.53MB
hashicorp/terraform   0.12.20          e6dd0042ca56   2 years ago      80.1MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)