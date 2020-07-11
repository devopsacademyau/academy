# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output

### To build first image and container
```
docker build -t exercise02:v1 -f Dockerfile.v1 .

docker run -d -p 8081:80 exercise02:v1
```

### To second second image and container
```
docker build -t exercise02:v2 -f Dockerfile.v2 .

docker run -d -p 8082:80 -v /root/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ exercise02:v2
```

- Curl command and its output of before changing the image:
```
curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
<h1>Modified</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
For the fist one, the index.html was copied via the Dockerfile.v1 and any further change to the local version is not reflected dinamically on the container. For the second one, the container is created mapping the local dir with a target folder on the container (using -v parameter), hence changes to the local  version of index.html are dinamically refelected on the container. 
```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
