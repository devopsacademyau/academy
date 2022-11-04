# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
docker run -it -p 8081:80 exercise02:v1

docker run -it --mount type=bind,source=/Users/james.corteciano@contino.io/github/academy/classes/03class/docker/artifacts/c03-docker02,target=/usr/local/apache2/htdocs -p 8082:80 exercise02:v2

$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

$curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl http://localhost:8082
<hr>
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
During building cointaner image of `exercise02:v1`, it which contains the copied index file. While the image `exercise02:v1`, it was executed with using bind mounts from the destination folder of index file at the local filesystem to the destination folder in the container. Meaning, whatever changes been made in the index file at the local filesystem will be reflected to the container.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)