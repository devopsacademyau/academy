# C03-Docker04

## Command Execution Output

- Commands executed to clean up both the images and the containers(running or exited) from your local:

```bash
## I've delete all docker images related to c03-classe on this exercise.
## Command stop all docker containers according its ID's
docker stop $(docker ps -aq)
# Output

## Command
docker rm $(docker ps -aq)
# Output
033363d661f6
dacafd4eed35
ff304e87c08e
b392496dd5bd

## Command
docker rmi $(docker images -q) -f
# Output
Untagged: gpavelar/exercise02:v2
Untagged: gpavelar/exercise02@sha256:ea05e4ef5dddb157d5b75e253c6c5f4e36ae297f06fe23a476edb625cd92d320
Untagged: exercise02:v2
Deleted: sha256:fcf95bce2dd9bd248101c3e9016239dc2a1fc4046c75d4b23130a5d966eda9ff
Deleted: sha256:003e1581be29c0331abb2461ebc565ef83363431f67731bf4dff47ac75028fa7
Deleted: sha256:22568495fcf4fba6dc60889f6a11a11b1c921d3d7c5bbecf046482f9c82d3ff7
Untagged: gpavelar/exercise02:v1
Untagged: gpavelar/exercise02@sha256:8d09be6febeb7c234de4c9f52d521dbfaeda1340f9ca87d84501d3f335ee3d13
Untagged: exercise02:v1
Deleted: sha256:73a3b15c384b5256d60feec2cd87162cf7aa3df691e84aa09b62cafe31fc6d44
Deleted: sha256:bd3d037c543cd39282a60c7914a31961eaa7ca308c7e6b562f4b437b0c428ef5
Untagged: httpd:2.4.41-alpine
Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
Error: No such image: fcf95bce2dd9
Error: No such image: 73a3b15c384b

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):

```bash
## Command
docker images && date
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
Sun 19 Jul 16:04:52 AEST 2020

## Command
docker container ls && date
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
Sun 19 Jul 16:09:20 AEST 2020
```

---

Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)
