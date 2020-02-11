# Class 03
## Agenda
- AWS EC2
    - Load Balancing
    - Auto Scaling Group
- AWS S3
- AWS Route 53
- Container - Docker
    - Repositories
    - Images
    - Dockerfile
    - AWS ECS
## AWS EC2
*WIP*
### Load Balancing
*WIP*
### Auto Scaling Group
*WIP*
## AWS S3
*WIP*
## AWS Route 53
*WIP*
## Containers
### What is a container?
A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another
**Add diagram with the packaging example**
### Difference between a Virtual Machine and a Container
Both the virtual machine and the container have resource isolation, but they work in a different way. While the virtual machine virtualizes the hardware, the container virtualizes the operating system. This makes the container a lot more portable and efficient.
**Add diagram with difference between VM and container**
#### Container
Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems. 
#### Virtual Machine
Virtual machines (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, the application, necessary binaries and libraries - taking up tens of GBs. VMs can also be slow to boot.
### Docker
[Docker](https://www.docker.com) is the most common container option in the market and have thousands of public images available to pack your application, but there are other options like the ones listed below:
- [rkt](https://coreos.com/rkt/)
- [LXC](https://linuxcontainers.org/)
- [OpenVZ](https://openvz.org/)

Docker is a tool to faciliate the creation, deployment and execution of applications by using containers.
It's composed by the docker daemon and the docker client. The first is the service that runs on the operating system(like Linux, MacOS, Windows) that will execute containers. The Docker deamon exposes a RestAPI that is accessed by the docker client. We use the docker client to submit instructions to the docker daemon so it can execute the containers, create new images, delete existing containers, connect to a running container, etc.
### Repositories
A container repository is a place where images can be stored and it can be public or private.
Examples of repositories:
- [DockerHub](https://hub.docker.com/)
- [AWS ECR](https://aws.amazon.com/ecr/)
- [Artifactory](https://jfrog.com/artifactory/)

Repositories are used to share an image that was created for a specific purpose. It can be used to store an image with specific pre-requisites to run multiple applications like:
- an image with apache+php+modules to run multiple php applications
- an image with a specific version of jdk to run multiple java applications
- an image with a specific version of mysql to run multiple databases

It can also be used to store the final version of your application(artifact) that will run in production
- an image with apache+php+modules+yourapp
- an image with python binaries and your application to run a machine learning algorythm
- an image with terraform cli that executes any terraform code

A docker repository is often used as a tool in the middle of the CI/CD process, since the docker image created during the CI pipeline needs to be stored somewhere so it can be used during the CD pipeline. More related to this in class #6.
### Dockerfile
A docker file is a set of instruction(like a recipe) to create a new docker image. Those instructions will be used to install the application pre-requisites as well as inlcude all the application related files into the image that is being created.
A docker file is always based on an existen docker image and the instructions included in the Docker file goes over that base image.
Example of Dockerfile:
```
FROM golang:1.14rc1-buster
COPY bin/ /
RUN chmod 544 /app/app1.bin && \
    chmod 500 /var/logs/* 
CMD [ "/app/app1.bin", "run" ]
```
#### Main Dockerfile Instructions:
- FROM
  - The base image that will be used to build the new image
- COPY
  - Copy files between the local filesystem to the container file system
- ADD
  - Similar to the COPY instruction, but it can be used to copy directly froma remote URL(http or https)
- RUN 
  - Executes a command into the container. The binary that will be executed must reside inside the container
- ENV
  - Creates an Environment Variable in the container
- EXPOSE
  - Expose a TCP or UDP port to inform Docker that the container will listen on the specified ports
- USER
  - Specify which user account will be used to run the commands inside the container when it runs
- CMD
  - Set a default command and default parameters which will be executed when docker is run. Those values can be overwritten during the contianer execution
- ENTRYPOINT
  - Used when the container needs to be run as an executable. The commandd inside ENTRYPOINT instruction will can't be overwritten during container execution.
- WORKDIR
  - Sets the working directory to run the instructions: RUN, CMD, ENTRYPOINT, COPY and ADD

Reference to all Instructions: [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)
#### Let's give it a go
Simple [Docker file](artifacts/docker/Dockerfile):
```bash
docker build -t website:01 .
```
```bash
docker run -it -p 8081:80 website:01
```
### Docker Image
An Image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime. An image typically contains an union of layered filesystems stacked on top of each other. An image does not have state and it never changes.
Each instruction in a Docker file adds a new layer during the build of the image.
An image is supposed to have everything required(pre-requisites and binaries) to run a specific application. Ideally we target for very small images, to make the container as much portable as possible.
```
FROM ubuntu:18.04
WORKDIR tmp
RUN apt-get update
RUN apt-get -y install curl
ADD http://apache.mirror.serversaustralia.com.au//httpd/httpd-2.4.41.tar.gz /tmp/
RUN tar xzvf /tmp/httpd-2.4.41.tar.gz
RUN rm -rf /tmp/httpd-2.4.41.tar.gz
```
```
FROM ubuntu:18.04
WORKDIR tmp
RUN apt-get update && apt-get install -y \
    curl \
 && rm -rf /var/lib/apt/lists/*
RUN curl -k http://apache.mirror.serversaustralia.com.au//httpd/httpd-2.4.41.tar.gz -o /tmp/httpd-2.4.41.tar.gz && \
    tar xzvf /tmp/httpd-2.4.41.tar.gz && \
    rm -rf /tmp/httpd-2.4.41.tar.gz
```
```
FROM ubuntu:18.04 AS builder
WORKDIR tmp
RUN apt-get update && apt-get install -y \
    curl \
 && rm -rf /var/lib/apt/lists/*
RUN curl -k http://apache.mirror.serversaustralia.com.au//httpd/httpd-2.4.41.tar.gz -o /tmp/httpd-2.4.41.tar.gz && \
    tar xzvf /tmp/httpd-2.4.41.tar.gz && \
    rm -rf /tmp/httpd-2.4.41.tar.gz
FROM ubuntu:18.04
COPY --from=builder /tmp /tmp
```
```bash
docker history website01
```
http://apache.mirror.serversaustralia.com.au//httpd/httpd-2.4.41.tar.gz
#### Important things to remember when creating a docker image
- Always use a tag to the image you'll use(FROM).
- Because of the way images are build(layers), keep the instructions that will change less on top of yout Dockerfile so you can make use of existent layers
### Main docker commands
- docker run
    - Creates and execute a new container    
- docker build
    - Build a new image from a docker file
- docker exec
    - Execute a command on a running container
- docker images
    - List the images stored on the local system managed by the docker daemon
- docker ps
    - List the running containers
- docker container [action]
    - Execute an action related to containers
    
Reference for all docker commands and options: [https://docs.docker.com/engine/reference/commandline/docker/](https://docs.docker.com/engine/reference/commandline/docker/)
### AWS ECS
*WIP*
### Exercise
*WIP*