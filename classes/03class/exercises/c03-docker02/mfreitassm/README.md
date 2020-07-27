# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
curl Localhost:8081 
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl Localhost:8082                                                                                                                         
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

-Comand to Build and Run Images
docker build -t exercise02:v1 -f classes/03class/exercises/c03-docker02/mfreitassm/Dockerfile.v1 .
Sending build context to Docker daemon  59.57MB
Step 1/3 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/3 : COPY classes/03class/docker/artifacts/c03-docker02/index.html /usr/local/apache2/htdocs/
 ---> 742a8036d02c
Step 3/3 : EXPOSE 80
 ---> Running in 7732aa4a26b0
Removing intermediate container 7732aa4a26b0
 ---> 61be3fbf28be
Successfully built 61be3fbf28be
Successfully tagged exercise02:v1

docker run -dp 8081:80 exercise02:v1
3643bc2ed3a6f6d13ebd9cfcfd5e86d8d10e459e9746e096c892cdd6d614b4d8

docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
exercise02          v1                  61be3fbf28be        4 minutes ago       107MB
da-terraform        c03-docker-e01      9569b8fd2524        6 hours ago         56.7MB
httpd               2.4.41-alpine       54b0995a6305        3 months ago        107MB
hello-world         latest              bf756fb1ae65        6 months ago        13.3kB
alpine              3.7                 6d1ef012b567        16 months ago       4.21MB

docker build -t exercise02:v2 -f classes/03class/exercises/c03-docker02/mfreitassm/Dockerfile.v2 .

Sending build context to Docker daemon  59.57MB
Step 1/3 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/3 : RUN rm /usr/local/apache2/htdocs/*
 ---> Running in e4d8f4a6dad9
Removing intermediate container e4d8f4a6dad9
 ---> 3b81a65bf79a
Step 3/3 : EXPOSE 80
 ---> Running in 38055a018fa7
Removing intermediate container 38055a018fa7
 ---> fa7b00b889e7
Successfully built fa7b00b889e7
Successfully tagged exercise02:v2

docker run -dp 8082:80 -v ~/Documents/projects/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs exercise02:v2 
969dc93fbded90d3de4f9ef9f87968e80f68db0cf44c810bbe470074af2083dc
```

- Curl command and its output of after changing the image:
```
curl Localhost:8081                                                                                                                         
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl Localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02 Mfreitassm</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
 In the first image  (http://localhost:8081/) has a copy of the index.html file inside the folder cand that's why the webserver's response was the same even after changed the index.hml file. In constrast, with the second image has access to host folder using (-v flag). When you use this, a file or directory on the host machine is mounted into a container. 
```
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)