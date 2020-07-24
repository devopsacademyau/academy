# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
docker ps

CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
2a648dd6a39f        exercise02:v2       "httpd-foreground"   7 seconds ago       Up 7 seconds        0.0.0.0:8082->80/tcp   mystifying_blackwell
278123b66ce5        exercise02:v1       "httpd-foreground"   9 seconds ago       Up 9 seconds        0.0.0.0:8081->80/tcp   pensive_neumann

docker stop mystifying_blackwell

mystifying_blackwell

docker stop pensive_neumann

pensive_neumann

docker image ls | grep exercise02

exercise02                                          v2                  7adc8b0b411c        2 hours ago         107MB
obrientimothy/exercise02                            v2                  7adc8b0b411c        2 hours ago         107MB
obrientimothya/exercise02                           v2                  7adc8b0b411c        2 hours ago         107MB
exercise02                                          v1                  4642026763e1        2 hours ago         107MB
obrientimothy/exercise02                            v1                  4642026763e1        2 hours ago         107MB
obrientimothya/exercise02                           v1                  4642026763e1        2 hours ago         107MB

docker image rm -f 7adc8b0b411c

Untagged: exercise02:v2
Untagged: obrientimothy/exercise02:v2
Untagged: obrientimothya/exercise02:v2
Untagged: obrientimothya/exercise02@sha256:bbd626711373d8c34c714d84e917ef7f684393bbe7f791391f3cc7dce45a4abf
Deleted: sha256:7adc8b0b411c25b7af094e7152cddd85170da42c6f6eb44fdfdb41c1844711a3

docker image rm -f 4642026763e1

Untagged: exercise02:v1
Untagged: obrientimothy/exercise02:v1
Untagged: obrientimothya/exercise02:v1
Untagged: obrientimothya/exercise02@sha256:8e5e84b943a57045767b3c9f331f755b12d4570ff86d9ceb12fc3be6e26cb8bd
Deleted: sha256:4642026763e1c6814f4d107f78a4a1e9a737ab30b1eada4ed0833ee94b42fe0e
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
docker ps

CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

docker image ls | grep exercise02
<empty>
```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)
