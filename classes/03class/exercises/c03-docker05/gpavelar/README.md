# C03-Docker05

## Command Execution Output

- Commands executed to run both containers:

```bash
## Pull image from Dockerhub
docker pull gpavelar/exercise02:v1
# Output
v1: Pulling from gpavelar/exercise02
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
64e26c6285cf: Pull complete
Digest: sha256:8d09be6febeb7c234de4c9f52d521dbfaeda1340f9ca87d84501d3f335ee3d13
Status: Downloaded newer image for gpavelar/exercise02:v1
docker.io/gpavelar/exercise02:v1

## Pull second image
docker pull gpavelar/exercise02:v2
# Output
v2: Pulling from gpavelar/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
cd1604911445: Pull complete
Digest: sha256:ea05e4ef5dddb157d5b75e253c6c5f4e36ae297f06fe23a476edb625cd92d320
Status: Downloaded newer image for gpavelar/exercise02:v2
docker.io/gpavelar/exercise02:v2

## Run First container
docker run -p 8081:80 -td gpavelar/exercise02:v1
# Output
68f9f0f2e25295d69d3fe05adde17194ffadce7e4cc6e5ade1408ab4712f415c

## Run Second Container
docker run --volume /var/scratch/Studies/academy/classes/03class/docker/artifacts/c03-docker02/:/usr/local/apache2/htdocs/ -p 8082:80 -td gpavelar/exercise02:v2
# Output
69b189178dbf904e1755ebe8d257c9bee2df32cb9d17c5265c4db1aafbd501a6
```

- A brief explanation of what happened when you executed the comands to run the containers:

```bash
It works exactly the same way that the previous exercises. It run a container using a specific image, but in this case, we needed to get the image from dockerhub because I did not have this image locally. So I did it using docker pull `gpavelar/exercise02:v1` and `gpavelar/exercise02:v2` before run its docker.
I did a example before use it.
```

- Command to list all images on your local as well as its Output:

```bash
## List images
docker image ls
# Output
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
gpavelar/exercise02   v2                  fcf95bce2dd9        25 hours ago        107MB
gpavelar/exercise02   v1                  73a3b15c384b        27 hours ago        107MB
```

---

Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)
