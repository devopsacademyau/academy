# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
exercise02                 v2                  fa7b00b889e7        58 minutes ago      107MB
mfreitassm/devopsacademy   v2                  fa7b00b889e7        58 minutes ago      107MB
exercise02                 v1                  61be3fbf28be        About an hour ago   107MB
mfreitassm/devopsacademy   v1                  61be3fbf28be        About an hour ago   107MB
da-terraform               c03-docker-e01      9569b8fd2524        7 hours ago         56.7MB
httpd                      2.4.41-alpine       54b0995a6305        3 months ago        107MB
hello-world                latest              bf756fb1ae65        6 months ago        13.3kB
alpine                     3.7                 6d1ef012b567        16 months ago       4.21MB

docker container stop $(docker container ls -aq)
969dc93fbded
2baa382634e0
3643bc2ed3a6
9e442341a9b6
37658c019950
5bfce432e1d3
67de1ff8a13e
5b3283b4c4c1
6bda02732cb1

docker rm $(docker ps -aq)
969dc93fbded
2baa382634e0
3643bc2ed3a6
9e442341a9b6
37658c019950
5bfce432e1d3
67de1ff8a13e
5b3283b4c4c1
6bda02732cb1

docker rmi $(docker images -q) -f
Untagged: exercise02:v2
Untagged: mfreitassm/devopsacademy:v2
Untagged: mfreitassm/devopsacademy@sha256:0c1e6acfaab9f6216af2773f168dbb7faa498ce741886fa94bde0866baa1af4e
Deleted: sha256:fa7b00b889e72339854d330c6896f040b8e3bc8a3b2d384fd3026b602ef7743d
Deleted: sha256:3b81a65bf79a13698946ce80fef3d7ebf01fb9cc53b4600e0a9b8c43aab5e87f
Deleted: sha256:693a00ba7057c7de07122faf05e8e23ba612e59e7a6b71202ffe50ad7e41596c
Untagged: exercise02:v1
Untagged: mfreitassm/devopsacademy:v1
Untagged: mfreitassm/devopsacademy@sha256:26f917769736a9257687038ba760c2ad2cc7ecf902a9f8d72eb111ebc773f452
Deleted: sha256:61be3fbf28be1fb861641e827b2faf8460a346485690e326a01f8c6a7e64be4f
Deleted: sha256:742a8036d02ce6f54abba8460eb53af1eabedfe134a9fbc6fa8a1db97c528190
Deleted: sha256:81a65ddb579cdf422f6bcffdaf986a9b0719b6092d707bfc32d8e8b1377a9a68
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:9569b8fd2524afd3de64d97ce9a691c9c992d1e8de49731ab50189c9cc65210d
Deleted: sha256:f6816e5200e0943450c8a373a0526cd2230770f0a14271572ab7331b280237a9
Deleted: sha256:a58d737e38ee90023628df2220d5a650361aed3fee2cab49a61bf34bbf2952f6
Deleted: sha256:07d52108ab1a92ace2a2f0d9955050119950d2f54503c39969ea14fb3ace94dc
Deleted: sha256:942a9ff11ecd3f82be3313c33bd8df5e588a4531bb673cfb2e7b8a01a3b1b40a
Untagged: httpd:2.4.41-alpine
Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
Untagged: hello-world:latest
Untagged: hello-world@sha256:49a1c8800c94df04e9658809b006fd8a686cab8028d33cfba2cc049724254202
Deleted: sha256:bf756fb1ae65adf866bd8c456593cd24beb6a0a061dedf42b26a993176745f6b
Deleted: sha256:9c27e219663c25e0f28493790cc0b88bc973ba3b1686355f221c38a36978ac63
Untagged: alpine:3.7
Untagged: alpine@sha256:8421d9a84432575381bfabd248f1eb56f3aa21d9d7cd2511583c68c9b7511d10
Deleted: sha256:6d1ef012b5674ad8a127ecfa9b5e6f5178d171b90ee462846974177fd9bdd39f
Deleted: sha256:3fc64803ca2de7279269048fe2b8b3c73d4536448c87c32375b2639ac168a48b
Error: No such image: fa7b00b889e7
Error: No such image: 61be3fbf28be
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)