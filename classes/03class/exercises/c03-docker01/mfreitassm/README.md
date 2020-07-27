# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
docker build -t da-terraform:c03-docker-e01 .

Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM alpine:3.7
 ---> 6d1ef012b567
Step 2/4 : WORKDIR /usr/src/app
 ---> Using cache
 ---> 07d52108ab1a
Step 3/4 : RUN apk update     && apk add wget unzip     && wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip     && unzip ./terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/     && rm  -f terraform_0.12.20_linux_amd64.zip
 ---> Running in 94435234ad98
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86_64/APKINDEX.tar.gz
v3.7.3-180-g5372bc29f3 [http://dl-cdn.alpinelinux.org/alpine/v3.7/main]
v3.7.3-183-gcc9ad2b48d [http://dl-cdn.alpinelinux.org/alpine/v3.7/community]
OK: 9054 distinct packages available
(1/2) Installing unzip (6.0-r3)
(2/2) Installing wget (1.20.3-r0)
Executing busybox-1.27.2-r11.trigger
OK: 5 MiB in 15 packages
--2020-07-19 06:00:06--  https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
Resolving releases.hashicorp.com... 151.101.81.183, 2a04:4e42:13::439
Connecting to releases.hashicorp.com|151.101.81.183|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 16207833 (15M) [application/zip]
Saving to: 'terraform_0.12.20_linux_amd64.zip'
  [...]
2020-07-19 06:00:12 (3.10 MB/s) - 'terraform_0.12.20_linux_amd64.zip' saved [16207833/16207833]

Archive:  ./terraform_0.12.20_linux_amd64.zip
  inflating: /usr/local/bin/terraform  
Removing intermediate container 94435234ad98
 ---> f6816e5200e0
Step 4/4 : CMD [ "terraform", "-v" ]
 ---> Running in ca5efb94822d
Removing intermediate container ca5efb94822d
 ---> 9569b8fd2524
Successfully built 9569b8fd2524
Successfully tagged da-terraform:c03-docker-e01

docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      9569b8fd2524        16 seconds ago      56.7MB
hello-world         latest              bf756fb1ae65        6 months ago        13.3kB
alpine              3.7                 6d1ef012b567        16 months ago       4.21MB
```

- Command to run the image and its output.:
```
docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20
```

***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)