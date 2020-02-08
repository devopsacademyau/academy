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

### Dockerfile
*WIP*

### Main docker commands
-docker run
    - Creates and execute a new container    
-docker build
    - Build a new image from a docker file
-docker exec
    - Execute a command on a running container
-docker images
    - List the images stored on the local system managed by the docker daemon
-docker ps
    - List the running containers
-docker container [action]
    - Execute an action related to containers

Reference for all docker commands and options: [https://docs.docker.com/engine/reference/commandline/docker/](https://docs.docker.com/engine/reference/commandline/docker/)

### AWS ECS
*WIP*

### Exercise
*WIP*
