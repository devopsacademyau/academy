# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)


Create a new docker image named `da-terraform` with the tag `c03-docker-e01` that will have the following pre requisites:
 - Final image is based from alpine. You can make use of multi-stage build using any image you want on other stages.
 - Terraform cli installed `version 0.12.20`
 - Make sure that the final image is smaller than 80Mb
 - When the image runs, it should output the version of the terraform cli tool: 
 ```bash
 $ docker run -it da-terraform:c03-docker-e01
 Terraform v0.12.20
```

## Command Execution Output
- Command to build the image:
```
z@bacon:~/Documents/GitHub/academy/classes/03class/exercises/c03-docker01/zarajoy$ docker build -t da-terraform:c03-docker-e01 .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM alpine:3.12.0
3.12.0: Pulling from library/alpine
df20fa9351a1: Already exists 
Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Status: Downloaded newer image for alpine:3.12.0
 ---> a24bb4013296
Step 2/3 : RUN apk update   && apk add --no-cache wget unzip   && wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip --output-file terraform.zip   && unzip ./terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/   && rm -f terraform.zip
 ---> Running in b9a096f67185
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
v3.12.0-156-g054ec5f545 [http://dl-cdn.alpinelinux.org/alpine/v3.12/main]
v3.12.0-159-gea3d0b7193 [http://dl-cdn.alpinelinux.org/alpine/v3.12/community]
OK: 12749 distinct packages available
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
(1/4) Installing unzip (6.0-r7)
(2/4) Installing libunistring (0.9.10-r0)
(3/4) Installing libidn2 (2.3.0-r0)
(4/4) Installing wget (1.20.3-r1)
Executing busybox-1.31.1-r16.trigger
OK: 8 MiB in 18 packages
Archive:  ./terraform_0.12.20_linux_amd64.zip
  inflating: /usr/local/bin/terraform  
Removing intermediate container b9a096f67185
 ---> 69ad9062b78e
Step 3/3 : CMD ["terraform", "--version"]
 ---> Running in ba8be489503c
Removing intermediate container ba8be489503c
 ---> 9ba96503f903
Successfully built 9ba96503f903
Successfully tagged da-terraform:c03-docker-e01

#is the imaage under 80MB? 
z@bacon:~/Documents/GitHub/academy/classes/03class/exercises/c03-docker01/zarajoy$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      9ba96503f903        2 minutes ago       76.5MB
alpine              3.12.0              a24bb4013296        6 weeks ago         5.57MB
hello-world         latest              bf756fb1ae65        6 months ago        13.3kB
#just....
```

- Command to run the image and its output.:
```
z@bacon:~/Documents/GitHub/academy/classes/03class/exercises/c03-docker01/zarajoy$ docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)