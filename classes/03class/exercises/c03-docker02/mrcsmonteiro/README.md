# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
# Build & run commands

$ docker build -t exercise02:v1 . -f Dockerfile.v1

$ docker run -d -p 8081:80 exercise02:v1

$ docker build -t exercise02:v2 . -f Dockerfile.v2

$ docker run -v /home/marcos/Repos/DevOpsAcademy/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -d -p 8082:80 exercise02:v2

$ curl localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

$ curl localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
# File /home/marcos/Repos/DevOpsAcademy/academy/classes/03class/docker/artifacts/c03-docker02/index.html was updated

$ curl localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

$ curl localhost:8082
<h1>DevOps Academy (changed) - Docker - Exercise c03-docker02</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
The content available in the container 'exercise02:v2' was affected, since the container was started with a bind mount. In this case, the directory is referenced by its path on the host machine. By constrast, the container 'exercise02:v1' had a copy of the index.html file inside it, and hosted within the Docker's directory on the host machine, hence Docker manages its content.
```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
