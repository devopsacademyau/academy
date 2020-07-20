# C03-Docker03

## Commands

- Commands executed to push both images to DockerHub as well as the output from those commands:

```bash
## I've already done another example how to push image to dockerhub, so
## all my credentials were set up.
## Docker images
docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
exercise02            v2                  fcf95bce2dd9        21 hours ago        107MB
exercise02            v1                  73a3b15c384b        23 hours ago        107MB

## Tagging image
docker tag 73a3b15c384b gpavelar/exercise02:v1
## Command
docker push gpavelar/exercise02:v1
# Output
The push refers to repository [docker.io/gpavelar/exercise02]
af3dadc62810: Pushed
8e24b43b535f: Pushed
1dfb4a5d0ecd: Pushed
3313c0c04ade: Pushed
310889822143: Pushed
beee9f30bc1f: Pushed
v1: digest: sha256:8d09be6febeb7c234de4c9f52d521dbfaeda1340f9ca87d84501d3f335ee3d13 size: 1569


## Command
docker tag fcf95bce2dd9 gpavelar/exercise02:v2
## Command
docker push gpavelar/exercise02:v2
# Output
The push refers to repository [docker.io/gpavelar/exercise02]
216d582031b4: Pushed
8e24b43b535f: Pushed
1dfb4a5d0ecd: Pushed
3313c0c04ade: Pushed
310889822143: Pushed
beee9f30bc1f: Pushed
v2: digest: sha256:ea05e4ef5dddb157d5b75e253c6c5f4e36ae297f06fe23a476edb625cd92d320 size: 1569
```

- So, on my dockerhub page there is a repository called `gpavelar/exercise02` with no description and **two** tags (v1 and v2).

Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
