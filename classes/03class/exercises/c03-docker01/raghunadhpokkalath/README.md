# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
> docker build -t da-terraform:c03-docker-e01 .

Sending build context to Docker daemon  3.072kB
Step 1/9 : FROM alpine:latest as downloader
 ---> a24bb4013296
Step 2/9 : WORKDIR /app/
 ---> Using cache
 ---> 0f103398000b
Step 3/9 : ADD https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip /app
Downloading [==================================================>]  16.21MB/16.21MB

 ---> Using cache
 ---> 44bb7b335b6d
Step 4/9 : RUN echo "terraform list"
 ---> Using cache
 ---> 0c618159ddcb
Step 5/9 : RUN unzip /app/terraform_0.12.20_linux_amd64.zip
 ---> Using cache
 ---> 1ed684aa1d16
Step 6/9 : FROM alpine:latest as builder
 ---> a24bb4013296
Step 7/9 : WORKDIR /app/
 ---> Using cache
 ---> 0f103398000b
Step 8/9 : COPY --from=0 /app/terraform .
 ---> Using cache
 ---> d7c47ceb3b1e
Step 9/9 : CMD ["/app/terraform", "--version"]
 ---> Running in f00744891d8f
Removing intermediate container f00744891d8f
 ---> 02ea851bc752
Successfully built 02ea851bc752
Successfully tagged da-terraform:c03-docker-e01

> docker images | grep da-terraform
da-terraform        c03-docker-e01      b906c142150c        7 minutes ago       56MB
```

- Command to run the image and its output.:
```
> docker run da-terraform:c03-docker-e01

Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html

``` 

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)