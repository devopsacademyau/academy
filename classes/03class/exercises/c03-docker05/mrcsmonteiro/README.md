# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
$ docker pull mrcsmonteiro/exercise02:v1
v1: Pulling from mrcsmonteiro/exercise02
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
379d5a58a935: Pull complete
Digest: sha256:d7ebc4eeaded7f0f8fdb7ac53ad90fafa552c94a5b66c35eb8d89e7404e96efa
Status: Downloaded newer image for mrcsmonteiro/exercise02:v1
docker.io/mrcsmonteiro/exercise02:v1

$ docker pull mrcsmonteiro/exercise02:v2
v2: Pulling from mrcsmonteiro/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
a70e583a44c8: Pull complete
Digest: sha256:84b4bb4c993c028645870afa77cd23e83db77736c589dde17cd7b3b3427faebf
Status: Downloaded newer image for mrcsmonteiro/exercise02:v2
docker.io/mrcsmonteiro/exercise02:v2

$ docker run -d -p 8081:80 mrcsmonteiro/exercise02:v1
d1287efc336c84633ed217b9e9d229362200b8dd0a0947e0d60f8c72a9cd290f

$ curl localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

$ docker run -v /home/marcos/Repos/DevOpsAcademy/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -d -p 8082:80 mrcsmonteiro/exercise02:v2
7f2408f1e845a43423fcc5ee6468ab82cea21e2e21e4f4e3e82c363a2beca355

$ curl localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
First I had to pull the images from Docker Hub. Since both versions share many identical layers, when v2 was pulled the process skipped most part of them. All the configurations were preserved (htdocs empty for container v2), so I had to repeat the bind mount command for 'exercise02:v2' in order to view the index.html page. 
```

- Command to list all images on your local as well as its output:
```
$ docker image ls -a
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
mrcsmonteiro/exercise02   v2                  27e2331a77d7        2 hours ago         107MB
mrcsmonteiro/exercise02   v1                  12b1fb2be42c        2 hours ago         107MB
```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)
