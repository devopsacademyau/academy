# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
$ docker container stop $(docker ps -a -q)
2cb6fc8b6a0a
9ea8eb87ef9b
7f33da3da3df

$ docker container rm $(docker ps -a -q)
2cb6fc8b6a0a
9ea8eb87ef9b

docker rmi -f $(docker images -a -q)
Untagged: juliopimentel/exercise02:v2
Untagged: juliopimentel/exercise02@sha256:67eb11f2a5e58b0a9ed6ae7d2bfedc16d266266e0a3afcffcb0c3296165635f5
Untagged: exercise02:v2
Deleted: sha256:547bc0b2e60f6dbc263f77af6b2461798b581ff5d4649a99956153614d1db925
Deleted: sha256:1f5ffee72bfbe31f9eef93ff6667328a4da19a55774ee028a5b6444a37ed6db2
Deleted: sha256:d7b95e35f149e7d04f95f89f8e07ecf275f423ba5d977eccba61106da790b79f
Untagged: julio-pimentel/exercise03:v1
Untagged: juliopimentel/exercise02:v1
Untagged: juliopimentel/exercise02@sha256:08345dfb077f1b8cc7abd15632bb8792c56d260a2318cc5ad4df821436183149
Untagged: exercise02:v1
Deleted: sha256:096fecbd2d9ee2e6ba82e431d56ec6fcf5544c05845d3ad6bf8cc5311d40cc98
Deleted: sha256:400415704f53211bd793d5b1a5df87150201b18b06fe00c6976d46971b287c08
Deleted: sha256:83e405e8a0f49aa06eefb8cf674d0b6b3b4b2af62e3cab4d457b79e2de007019
Deleted: sha256:a673f1748f7295e2c09daaf8a12ee112ecc82fb43257c87e41a2c5d504de017d
Deleted: sha256:6c33243de141a40dfe192c058610f6b97f4777765b38f9514c9b573c07609998
Untagged: httpd:2.4.41-alpine
Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
Error response from daemon: conflict: unable to delete 1f5ffee72bfb (cannot be forced) - image has dependent child images
Error: No such image: 547bc0b2e60f
Error response from daemon: conflict: unable to delete 400415704f53 (cannot be forced) - image has dependent child images
Error: No such image: 096fecbd2d9e
Error: No such image: 096fecbd2d9e
Error: No such image: a673f1748f72

$ docker ps -all
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
$ docker images -a
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
Add command here
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)