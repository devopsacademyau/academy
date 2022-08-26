# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:

First open the terminal and navigate to the working directory where Dockerfile is stored. Then build the image using following command

```
docker build -t da-terraform:c03-docker-e01 .
Output:
    
[+] Building 4.3s (9/9) FINISHED                                                                                                        
 => [internal] load build definition from Dockerfile                                                                               0.0s
 => => transferring dockerfile: 495B                                                                                               0.0s
 => [internal] load .dockerignore                                                                                                  0.0s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/alpine:3.14                                                                     3.0s
 => [1/5] FROM docker.io/library/alpine:3.14@sha256:1ab24b3b99320975cca71716a7475a65d263d0b6b604d9d14ce08f7a3f67595c               0.0s
 => CACHED [2/5] WORKDIR /usr/bin                                                                                                  0.0s
 => CACHED [3/5] RUN wget https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip                           0.0s
 => [4/5] RUN unzip terraform_1.2.7_linux_amd64.zip && rm terraform_1.2.7_linux_amd64.zip                                          0.8s
 => [5/5] RUN mv terraform /usr/bin/terraform                                                                                      0.2s
 => exporting to image                                                                                                             0.1s 
 => => exporting layers                                                                                                            0.1s
 => => writing image sha256:bade9a1b61d25a909d2728ce6c90c297951cce8c7a2b644c67dcfe201c69c283                                       0.0s
 => => naming to docker.io/library/da-terraform:c03-docker-e01                                                                     0.0s
```

Using "Docker images" command we can get the image size and other details like IMAGE ID, TAG, REPOSITORY

```
docker images

Outut:
REPOSITORY     TAG              IMAGE ID       CREATED          SIZE
da-terraform   c03-docker-e01   bade9a1b61d2   15 minutes ago   88.2MB
```
Plesae note latest version of Terraform takes more space than older versions. Therefore, image size exceeds 80 mb.
Tried installing Terraform v0.12.21 which was 76 mb in size. 

- Command to run the image and its output.:

Start the docker container using
```
docker run -it da-terraform:c03-docker-e01
Output
    Terraform v1.2.7
    on linux_amd64
```


***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)