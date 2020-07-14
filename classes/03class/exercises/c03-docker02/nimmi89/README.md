# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
$ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
$ curl http://localhost:8082
<h1>Changed !!!!DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
>sudo docker run -itd -p 8081:80 exercise02:v1
The first webserver doesnt reflect the changes done on the file locally on the host as it was copied during build time. 

>sudo docker run -itd --volume classes/03class/docker/artifacts/c03-docker02/:/usr/local/apache2/htdocs/ -p 8082:80 exercise02:v2
The second webserver reflects the changes as volume flag with the directories was used during launching the container.It mounted the working directory where file changes were made into the container directory.
```



***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
