# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
https://phoenixnap.com/kb/remove-docker-images-containers-networks-volumes

https://stackoverflow.com/questions/16840409/how-to-list-containers-in-docker


```
```
z@bacon:~/Documents/GitHub$ docker container ls -a
CONTAINER ID        IMAGE                         COMMAND                 CREATED             STATUS                      PORTS                  NAMES
36d136c12ce6        exercise02:v2                 "httpd-foreground"      45 hours ago        Exited (255) 27 hours ago   0.0.0.0:8082->80/tcp   crazy_merkle
e68856e86ace        exercise02:v1                 "httpd-foreground"      45 hours ago        Exited (255) 27 hours ago   0.0.0.0:8081->80/tcp   festive_curie
0881477810c1        1b64f78d0022                  "httpd-foreground"      47 hours ago        Exited (0) 47 hours ago                            dazzling_wing
f3253c118f8a        1b64f78d0022                  "httpd-foreground"      2 days ago          Exited (0) 47 hours ago                            distracted_lumiere
4945c70bf233        da-terraform:c03-docker-e01   "terraform --version"   2 days ago          Exited (0) 2 days ago                              kind_wescoff
92196d17a772        e80f6088902d                  "terraform -v"          2 days ago          Exited (0) 2 days ago                              jolly_chatelet
9e5ae1055e9c        d2520a84cc78                  "terraform -v"          2 days ago          Exited (0) 2 days ago                              sharp_swanson

z@bacon:~/Documents/GitHub$ docker rm -f $(docker ps -a -q)  
36d136c12ce6
e68856e86ace
0881477810c1
f3253c118f8a
4945c70bf233
92196d17a772
9e5ae1055e9c

z@bacon:~/Documents/GitHub$ docker container ls -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

z@bacon:~/Documents/GitHub$ docker image ls
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
exercise02               v2                  a7a98839daaa        45 hours ago        107MB
zarajoy/devops-academy   exercise02-v2       a7a98839daaa        45 hours ago        107MB
exercise02               v1                  afa39ca8a43d        45 hours ago        107MB
zarajoy/devops-academy   exercise02-v1       afa39ca8a43d        45 hours ago        107MB
da-terraform             c03-docker-e01      9ba96503f903        2 days ago          76.5MB
alpine                   3.12.0              a24bb4013296        6 weeks ago         5.57MB
httpd                    2.4.41-alpine       54b0995a6305        3 months ago        107MB
hello-world              latest              bf756fb1ae65        6 months ago        13.3kB

z@bacon:~/Documents/GitHub$ docker rmi $(docker images -q) -f
Untagged: exercise02:v2
Untagged: zarajoy/devops-academy:exercise02-v2
Untagged: zarajoy/devops-academy@sha256:7ab11bdd0e6aa4c43afee169e45e35f48c62404575c11b693c3adcc36c1b0adf
Deleted: sha256:a7a98839daaad92f152a12a29ef5c17e39714458470b2f67161d3e8f06cc23f4
Deleted: sha256:be7b35e14298381ac8ac5a0aff23c8f63c5258335744339e7108d98545bda5a5
Untagged: exercise02:v1
Untagged: zarajoy/devops-academy:exercise02-v1
Untagged: zarajoy/devops-academy@sha256:1b62c8c0957f2e2b6a9af817ac7c3b9ad7bfa50678b19577216f111ac2ca011b
Deleted: sha256:afa39ca8a43d9177d66ce685da8bddeaa7849ec94a5a7731ebc6cbfd3ac7a3f1
Deleted: sha256:e47184ebd52c263a7e1daeb33a580c37cd3ffb5a607d0c24029f2e50c69c7604
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:9ba96503f903f557955106e332bcc787e6080644e8f5bfeedc414d561ed02468
Deleted: sha256:69ad9062b78e1633be2eab4721eee528372db45c5802fd5418cc95e278cf611f
Deleted: sha256:29f597d736365ed7cdf407f175a606313c436a2cc3ac85a489fc0f35cd50f666
Untagged: alpine:3.12.0
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
Untagged: hello-world:latest
Untagged: hello-world@sha256:6a65f928fb91fcfbc963f7aa6d57c8eeb426ad9a20c7ee045538ef34847f44f1
Deleted: sha256:bf756fb1ae65adf866bd8c456593cd24beb6a0a061dedf42b26a993176745f6b
Deleted: sha256:9c27e219663c25e0f28493790cc0b88bc973ba3b1686355f221c38a36978ac63
Error: No such image: a7a98839daaa
Error: No such image: afa39ca8a43d
z@bacon:~/Documents/GitHub$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
z@bacon:~/Documents/GitHub$ docker container ls -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
z@bacon:~/Documents/GitHub$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)