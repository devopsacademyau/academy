# C03-Docker02

## Docker
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
## Dockerfile V1

> docker build -t exercise02:v1 -f Dockerfile.v1 .

> docker run -d -p 8081:80 exercise02:v1

> curl http://localhost:8081
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

## Dockerfile V2

> docker build -t exercise02:v2 -f Dockerfile.v2 .

> docker run -p 8082:80 exercise02:v2

> docker run -d -p 8082:80 \
    --name container-v2 \
    --mount type=bind,source=/Users/jay/academy/classes/03class/docker/artifacts/c03-docker02,target=/usr/local/apache2/htdocs/ \
    exercise02:v2

## Volume of the container-v2
## Output of the inspect command was trimmed for brevity
> docker inspect container-v2

    "Mounts": [
        {
            "Type": "bind",
            "Source": "/Users/jay/academy/classes/03class/docker/artifacts/c03-docker02",
            "Destination": "/usr/local/apache2/htdocs",
            "Mode": "",
            "RW": true,
            "Propagation": "rprivate"
        }
    ]

> curl http://localhost:8082
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

## Two containers are running
➜  jayanath git:(jayanath/c03-docker02) ✗ docker ps
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
65a0aa6bbf7c        exercise02:v1       "httpd-foreground"   5 seconds ago       Up 4 seconds        0.0.0.0:8081->80/tcp   sharp_raman
d0a40b8c4112        exercise02:v2       "httpd-foreground"   36 minutes ago      Up 36 minutes       0.0.0.0:8082->80/tcp   container-v2

```

- Curl command and its output of after changing the image:
```
## Version 1
➜  jayanath git:(jayanath/c03-docker02) ✗ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

## Version 2
➜  jayanath git:(jayanath/c03-docker02) ✗ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
<h3>the answer to life the universe and everything is 42</h3>

```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
Version 1 use COPY to bake in the index.html into the docker image itself during build process.
when we start a container using that image, it has no connection to the source of the files copied into the image.
Hence we don't see the index.html updates on version 1 container.

Version 2 bind-mount the target directory into the container at runtime. Bind mount allows the changes of the source directory contents
to reflect in the container at real time. Hence we see the updates of the index.html on version 2 container.
<h3>the answer to life the universe and everything is 42</h3>

```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)