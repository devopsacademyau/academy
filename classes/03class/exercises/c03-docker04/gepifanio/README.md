# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```

docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
guiepifanio/exercise02   v2                  e0256558b30d        5 hours ago         107MB
exercise02               v2                  e0256558b30d        5 hours ago         107MB
da-terraform             c03-docker-e01      ce2bed8d6a5c        6 hours ago         57.8MB
guiepifanio/exercise02   v1                  ae3f673ae115        3 days ago          107MB
exercise02               v1                  ae3f673ae115        3 days ago          107MB
alpine                   latest              a24bb4013296        6 weeks ago         5.57MB
httpd                    2.4.41-alpine       54b0995a6305        3 months ago        107MB

docker image rm guiepifanio/exercise02:v1
Untagged: guiepifanio/exercise02:v1
Untagged: guiepifanio/exercise02@sha256:1a8773da5c34898fbf2b31bcf92f9d30fe87799463f0423444b76aadabb9dd6d

docker rmi -f $(docker images -a -q)
Untagged: guiepifanio/exercise02:v2
Untagged: guiepifanio/exercise02@sha256:b659c7fb10f86923d4bdb59a1366b4e425eceb85b7b2ba0b8e6dad1b217a1888
Untagged: exercise02:v2
Deleted: sha256:e0256558b30d4b7b9bb9f460696152b6f27333d12c45e4c340c7bddae2fd1eb5
Deleted: sha256:b493cbe4df2530dfb9bd7493d86ef91052b8c798554043843ae0da9f20df30b5
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:ce2bed8d6a5c6666a444d545eeb015a77e984919bb62673b75bc76798fe23e6c
Deleted: sha256:54cc3c995a57f6f15e5718197538a8d103413c62381cd8268a062f85d0820a6d
Deleted: sha256:41bfd5309b8489d1df13f7d33e61c09405bede7aa89f1e71cd48209cdc5a3ebd
Deleted: sha256:b21bd8e37f8bb64fbc502c1bca8bccdbbf3c603fcb24b9c5e90b96201c8fc7b9
Untagged: exercise02:v1
Deleted: sha256:ae3f673ae1154cb322825897db3bf8d511246067cea03f33983e169a94b1b798
Deleted: sha256:a1a30109fd6a0c01f7a72b7966f501bc56bc67c36be158ed9d482f7fa717eed7
Untagged: alpine:latest
Untagged: alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Deleted: sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e
Deleted: sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a
Untagged: httpd:2.4.41-alpine
Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
Error: No such image: e0256558b30d
Error response from daemon: conflict: unable to delete 54cc3c995a57 (cannot be forced) - image has dependent child images
Error: No such image: b21bd8e37f8b



```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```

docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)