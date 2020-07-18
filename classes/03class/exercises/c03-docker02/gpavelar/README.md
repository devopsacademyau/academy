# C03-Docker02

## Docker

- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output

- Curl command and its output of before changing the image:

```bash
## Curl first container
(base)  crazynight ~  curl http://localhost:8081
# Output
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

### Curl second container
(base)  crazynight ~  curl http://localhost:8082
# Output
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>


```

- Curl command and its output of after changing the image:

```bash
## Curl first container
(base)  crazynight ~  curl http://localhost:8081
# Output
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

## Curl second container
curl http://localhost:8082
# Output
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
<p> my first container ever lol. It was a little bit tragic</p>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:

```
To be honest, When you mapped you local machine directory it sets link between local directory and one target directory inside the container. In the first case it doest not happen, because the container and the host file system are not sharing information.
```

### Building commands

- Dockerfile.v1:

```bash
## Command
docker build -t exercise02:v1 --file "./Dockerfile.v1" /var/scratch/Studies/academy
# Output
Sending build context to Docker daemon  60.03MB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY classes/03class/docker/artifacts/c03-docker02/index.html /usr/local/apache2/htdocs/
 ---> Using cache
 ---> 73a3b15c384b
Successfully built 73a3b15c384b
Successfully tagged exercise02:v1
```

- Dockerfile.v2:

```bash
## Command
docker build -t exercise02:v2 --file "./Dockerfile.v2" /var/scratch/Studies/academy
# Output
Sending build context to Docker daemon  60.03MB
Step 1/3 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/3 : RUN rm /usr/local/apache2/htdocs/index.html
 ---> Running in 9c7ed2266f18
Removing intermediate container 9c7ed2266f18
 ---> 003e1581be29
Step 3/3 : RUN ls /usr/local/apache2/htdocs
 ---> Running in e0b241bc0254
Removing intermediate container e0b241bc0254
 ---> fcf95bce2dd9
Successfully built fcf95bce2dd9
Successfully tagged exercise02:v2

### Run Container
## First
docker run -p 8081:80 -td exercise02:v1
## Second
docker run --volume /var/scratch/Studies/academy/classes/03class/docker/artifacts/c03-docker02/:/usr/local/apache2/htdocs/ -p 8082:80 -td exercise02:v2
```

### Issues

- Docker context

> I was trying to execute my Dockerfile.v1 inside my directory c03-docker02/gpavelar/. It was not recognizing the file `classes/03class/docker/artifacts/c03-docker02/index.html` on the `COPY` and/or `ADD` command. So I needed to change the context and build the image using `docker build -t exercise02:v1 --file "./Dockerfile.v1" /var/scratch/Studies/academy`

> As a beginner, Which parameter should i use `--volume` or `--mount`?

> docker run --volume classes/03class/docker/artifacts/c03-docker02/:/usr/local/apache2/htdocs/ -p 8082:80 -td exercise02:v2
> docker: Error response from daemon: create classes/03class/docker/artifacts/c03-docker02/: "classes/03class/docker/artifacts/c03-docker02/" includes invalid characters for a local volume name, only "[a-zA-Z0-9][a-za-z0-9_.-]" are allowed. If you intended to pass a host directory, use absolute path.
> See 'docker run --help'.

---

Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
