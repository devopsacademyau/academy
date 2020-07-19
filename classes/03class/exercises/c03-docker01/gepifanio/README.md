# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```

docker build -t da-terraform:c03-docker-e01 classes/03class/exercises/c03-docker01/gepifanio

Sending build context to Docker daemon  6.656kB
Step 1/4 : FROM alpine
 ---> a24bb4013296
Step 2/4 : ARG TERRAFORM_VERSION=0.12.20
 ---> Running in 5731f6ff5d47
Removing intermediate container 5731f6ff5d47
 ---> b21bd8e37f8b
Step 3/4 : RUN apk update &&     wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip &&     unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin &&     rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
 ---> Running in ca60fa773848
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
v3.12.0-160-g96d355a76e [http://dl-cdn.alpinelinux.org/alpine/v3.12/main]
v3.12.0-165-g0169509cb9 [http://dl-cdn.alpinelinux.org/alpine/v3.12/community]
OK: 12749 distinct packages available
Connecting to releases.hashicorp.com (151.101.1.183:443)
saving to 'terraform_0.12.20_linux_amd64.zip'
terraform_0.12.20_li  12% |***                             | 1955k  0:00:07 ETA
terraform_0.12.20_li  43% |*************                   | 6835k  0:00:02 ETA
terraform_0.12.20_li  72% |***********************         | 11.2M  0:00:01 ETA
terraform_0.12.20_li 100% |********************************| 15.4M  0:00:00 ETA
'terraform_0.12.20_linux_amd64.zip' saved
Archive:  terraform_0.12.20_linux_amd64.zip
  inflating: terraform
Removing intermediate container ca60fa773848
 ---> 54cc3c995a57
Step 4/4 : CMD terraform -v
 ---> Running in 3d8baadbdb84
Removing intermediate container 3d8baadbdb84
 ---> ce2bed8d6a5c
Successfully built ce2bed8d6a5c
Successfully tagged da-terraform:c03-docker-e01

```

- Command to run the image and its output.:
```

docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      ce2bed8d6a5c        23 seconds ago      57.8MB
exercise02          v1                  ae3f673ae115        2 days ago          107MB
alpine              latest              a24bb4013296        6 weeks ago         5.57MB
httpd               2.4.41-alpine       54b0995a6305        3 months ago        107MB
exercise02          v2                  54b0995a6305        3 months ago        107MB


docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)