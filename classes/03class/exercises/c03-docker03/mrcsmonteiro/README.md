# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
$ docker tag exercise02:v1 mrcsmonteiro/exercise02:v1

$ docker push mrcsmonteiro/exercise02:v1
The push refers to repository [docker.io/mrcsmonteiro/exercise02]
c5efc45cd181: Pushed
8e24b43b535f: Pushed
1dfb4a5d0ecd: Pushed
3313c0c04ade: Pushed
310889822143: Pushed
beee9f30bc1f: Pushed
v1: digest: sha256:d7ebc4eeaded7f0f8fdb7ac53ad90fafa552c94a5b66c35eb8d89e7404e96efa size: 1569

$ docker tag exercise02:v2 mrcsmonteiro/exercise02:v2

$ docker push mrcsmonteiro/exercise02:v2
The push refers to repository [docker.io/mrcsmonteiro/exercise02]
d9070b33584a: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
v2: digest: sha256:84b4bb4c993c028645870afa77cd23e83db77736c589dde17cd7b3b3427faebf size: 1569
```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
