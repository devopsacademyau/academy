# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```

docker build -t da-terraform:c03-docker-e01 classes/03class/exercises/c03-docker01/gepifanio

Untagged: da-terraform:c03-docker-e01
Deleted: sha256:cff260e8963ad3bc4dceff644073ec166cd7417ef4bd4c46486ce101700d09f1
Deleted: sha256:21656f0bfa976cd511f759a9192a85717a16bd4219eef50c72263de085d3d14d
Deleted: sha256:0fbec5e3e59ff34ab92e8c4c3173780cfe0f5dda12b36f1e6517e92bb77d0f1d
Deleted: sha256:c1d5646b0f9b43eed1adc980090a6812596b0d31a3400904292b85b21cc0e279
Untagged: alpine:latest
Untagged: alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Deleted: sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e
Deleted: sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a
Error: No such image: c1d5646b0f9b
Error: No such image: 0fbec5e3e59f
➜  academy git:(gepifanio/c03-docker01) ✗ code .
➜  academy git:(gepifanio/c03-docker01) ✗ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
➜  academy git:(gepifanio/c03-docker01) ✗ docker build -t da-terraform:c03-docker-e01 classes/03class/exercises/c03-docker01/gepifanio
Sending build context to Docker daemon   5.12kB
Step 1/4 : FROM alpine
latest: Pulling from library/alpine
df20fa9351a1: Pull complete
Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Status: Downloaded newer image for alpine:latest
 ---> a24bb4013296
Step 2/4 : ENV TERRAFORM_VERSION=0.12.20
 ---> Running in 4d68128dfd96
Removing intermediate container 4d68128dfd96
 ---> 6024be53f1bd
Step 3/4 : CMD terraform -v
 ---> Running in 0365040dcea0
Removing intermediate container 0365040dcea0
 ---> 97638fbcee1e
Step 4/4 : RUN apk update &&     wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&     unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
 ---> Running in b098a5d7ba93
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
v3.12.0-156-g054ec5f545 [http://dl-cdn.alpinelinux.org/alpine/v3.12/main]
v3.12.0-157-g7a5e481ae2 [http://dl-cdn.alpinelinux.org/alpine/v3.12/community]
OK: 12749 distinct packages available
Connecting to releases.hashicorp.com (151.101.1.183:443)
saving to 'terraform_0.12.20_linux_amd64.zip'
terraform_0.12.20_li   6% |**                              | 1084k  0:00:13 ETA
terraform_0.12.20_li  42% |*************                   | 6653k  0:00:02 ETA
terraform_0.12.20_li  85% |***************************     | 13.1M  0:00:00 ETA
terraform_0.12.20_li 100% |********************************| 15.4M  0:00:00 ETA
'terraform_0.12.20_linux_amd64.zip' saved
Archive:  terraform_0.12.20_linux_amd64.zip
  inflating: terraform
Removing intermediate container b098a5d7ba93
 ---> 895165770bfb
Successfully built 895165770bfb
Successfully tagged da-terraform:c03-docker-e01

```

- Command to run the image and its output.:
```

docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      cff260e8963a        25 seconds ago      74MB
alpine              latest              a24bb4013296        6 weeks ago         5.57MB


docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)