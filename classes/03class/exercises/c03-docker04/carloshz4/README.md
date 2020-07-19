# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
carloshz4/exercise02   v2                  5a445065cb2e        25 hours ago        107MB
exercise02             v2                  5a445065cb2e        25 hours ago        107MB
carloshz4/exercise02   v1                  3f38bd842238        26 hours ago        107MB
exercise02             v1                  3f38bd842238        26 hours ago        107MB
da-terraform           c03-docker-e01      ec3cbdf038c8        43 hours ago        52.7MB
alpine                 latest              a24bb4013296        6 weeks ago         5.57MB

docker image rm carloshz4/exercise02:v2 exercise02:v2 carloshz4/exercise02:v1 exercise02:v1 da-terraform:c03-docker-e01 alpine:latest
Untagged: carloshz4/exercise02:v2
Untagged: carloshz4/exercise02@sha256:e4fbe86cc627fd9ab47e627f3935261a429a5a375ce6d9f57fb446eb8b0f8a7e
Untagged: exercise02:v2
Deleted: sha256:5a445065cb2e578012fcf30e048496584e525fdbc645a173ec9d32910c2123a1
Deleted: sha256:2386693d36fdadbd302319596a5c96d9556e26ca96467a4b9da90ae564df0309
Untagged: carloshz4/exercise02:v1
Untagged: carloshz4/exercise02@sha256:780aa1a6a4db5adbbf81dbf8ac79656d7ff86c4c0ae1680b39aaf0b38f334e33
Untagged: exercise02:v1
Deleted: sha256:3f38bd8422385c279f458e4dc40a239f74f6c8b9e592d99a18b9717c98f17e71
Deleted: sha256:9ddc3685f8de9c06d94e6f64300b41da9517f270e3493240080a5e1b0afb9637
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:ec3cbdf038c89f4227c51830e4e5c6b6d685fc8bfa9805760407797694272559
Deleted: sha256:41761aad763a3c3cbd5251d92c24a5f8c998a6459ef0b2b9faa9cd194eb92e96
Deleted: sha256:0b0eabab353c78a59e4bc7f021ae6b83a1ffa25e596e521b36929010cc10834b
Untagged: alpine:latest
Untagged: alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Deleted: sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e
Deleted: sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a



docker ps -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS                      PORTS                  NAMES
a3cb788f9ff3        exercise02:v2       "httpd-foreground"   25 hours ago        Exited (255) 22 hours ago   0.0.0.0:8082->80/tcp   festive_ellis
3a8e100b0890        exercise02:v1       "httpd-foreground"   26 hours ago        Exited (255) 22 hours ago   0.0.0.0:8081->80/tcp   happy_hellman

docker rm a3cb788f9ff3 3a8e100b0890
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)