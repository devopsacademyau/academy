# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```bash
# List containers docker-ex-v1 and docker-ex-v2
❯ docker container ls -a --filter "name=docker-ex-v*"
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
d1c0ffc7e65b        exercise02:v2       "httpd-foreground"   2 hours ago         Up 3 seconds        0.0.0.0:8082->80/tcp   docker-ex-v2
9c967049587d        exercise02:v1       "httpd-foreground"   3 hours ago         Up 3 seconds        0.0.0.0:8081->80/tcp   docker-ex-v1

# Stop containers
❯ docker stop $(docker container ls -a --filter "name=docker-ex-v*" --format="{{.ID}}")
d1c0ffc7e65b
9c967049587d

# Remove containers
❯ docker rm $(docker container ls -a --filter "name=docker-ex-v*" --format="{{.ID}}")
d1c0ffc7e65b
9c967049587d


# List images exercise02:v1 and exercise02:v2
❯ docker images --filter=reference='exercise02:*'                   
REPOSITORY     TAG                 IMAGE ID            CREATED             SIZE
exercise02     v1                  04f08a8469d9        4 hours ago         107MB
exercise02     v2                  54b0995a6305        3 months ago        107MB

# Remove images
❯ docker rmi $(docker images --filter=reference='exercise02:*' --format="{{.ID}}") -f
Untagged: exercise02:v1
Untagged: exercise02@sha256:babbe881af088549b6f6645a0751a911e172c4df42541acd5f06d8f3e2c77f2c
Deleted: sha256:04f08a8469d9062fc63b993babc7574e34654a992dd6abe50704585d8ca0d42f
Deleted: sha256:f3d73b2902791f363ad434a38c4449dcef45c2302e4a231f8399cebc280d9084
Untagged: exercise02:v2
Untagged: exercise02@sha256:007c7d4ba3d9a1d92209d4cc545607c6b72f58ba2b104f1caf309428d770680a
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```bash
# List containers docker-ex-v1 and docker-ex-v2
❯ docker container ls -a --filter "name=docker-ex-v*"                                  
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

# List images exercise02:v1 and exercise02:v2
❯ docker images --filter=reference='exercise02:*' 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)