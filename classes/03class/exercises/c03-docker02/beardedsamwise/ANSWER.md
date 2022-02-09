# C03-Docker02

## Docker 
- [Dockerfile.v1](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-docker02/classes/03class/exercises/c03-docker02/beardedsamwise/dockerfile.v1)
- [Dockerfile.v2](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-docker02/classes/03class/exercises/c03-docker02/beardedsamwise/dockerfile.v2)

## Command Execution Output
- Commands to run docker containers
```
docker run -it -p 8081:80 exercise02:v1
docker run -it --mount type=bind,src=/Users/sam.bentley@contino.io/Desktop/academy/classes/03class/exercises/c03-docker02/beardedsamwise/web,dst=/usr/local/apache2/htdocs -p 8082:80 exercise02:v2
```

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
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

<h2>An update</h2>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
The v1 image does not change as the image uses COPY to copy the file from the local machine to the container which runs at docker build, not docker run (ie. the file won't change unless you rebuild the image). 

The v2 image does change as the directory where index.html is stored is mounted into the docker container (ie. the htdocs folder is empty in the docker container, the container is reading index.html from my local filesystem). Since the docker container has direct access the local file system it can read any changes that are made.

Note: local filesytem = the file system of my workstation/Mac
```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)