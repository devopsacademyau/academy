# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```bash
❯ docker run -dp 8081:80 --name docker-ex-v1 facp/exercise02:v1
Unable to find image 'facp/exercise02:v1' locally
v1: Pulling from facp/exercise02
aad63a933944: Already exists 
29ade582b51e: Already exists 
7e41ad5b6f9c: Already exists 
ebf61b47b4ca: Already exists 
9c060bce4eae: Already exists 
abd5a29e0bb6: Pull complete 
Digest: sha256:babbe881af088549b6f6645a0751a911e172c4df42541acd5f06d8f3e2c77f2c
Status: Downloaded newer image for facp/exercise02:v1
fa5bf09a1490e486f0c2319d9a7c315d4aae2eea11da8b080c139f0e63ebf5c4

❯ docker run -dp 8082:80 \
  --name docker-ex-v2 \
  --mount type=bind,source="$(pwd)"/classes/03class/docker/artifacts/c03-docker02/,target=/usr/local/apache2/htdocs/ \
  facp/exercise02:v2
Unable to find image 'facp/exercise02:v2' locally
v2: Pulling from facp/exercise02
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
Digest: sha256:007c7d4ba3d9a1d92209d4cc545607c6b72f58ba2b104f1caf309428d770680a
Status: Downloaded newer image for facp/exercise02:v2
8493df7a029a72426ea83cb432693b34967fb51869be7c46f19937cfd51d1493
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
It tries to find the image locally. When it's not able to find it then the image is downloaded from the docker hub repository.
```

- Command to list all images on your local as well as its output:
```bash
❯ docker images --filter=reference='facp/exercise02:*' 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
facp/exercise02     v1                  04f08a8469d9        41 hours ago        107MB
facp/exercise02     v2                  54b0995a6305        3 months ago        107MB
```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)
