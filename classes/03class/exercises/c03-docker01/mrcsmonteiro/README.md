# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
# Build image

$ docker build -t da-terraform:c03-docker-e01 .

# Image < 80MB

$ docker image ls da-terraform
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      8004d77f099c        4 minutes ago       57.3MB
```

- Command to run the image and its output.:
```
$ docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html
```

***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)
