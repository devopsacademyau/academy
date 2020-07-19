# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
List all the docker containers(running or existed)
> docker container ls -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS                           PORTS                  NAMES
ee672a9d6073        exercise02:v2       "httpd-foreground"   16 hours ago        Exited (255) About an hour ago   0.0.0.0:8082->80/tcp   unruffled_pascal
03db3796886a        exercise02:v1       "httpd-foreground"   17 hours ago        Exited (255) About an hour ago   0.0.0.0:8081->80/tcp   determined_goldstine
dedad73df1a9        exercise02:v1       "httpd-foreground"   17 hours ago        Exited (0) 17 hours ago                                 dreamy_albattani
5ff8ae9b1ce9        exercise02:v1       "httpd-foreground"   17 hours ago        Exited (0) 17 hours ago                                 objective_tharp
 
Remove all the containers that are stopped 
> docker container rm $(docker container ls -aq)
ee672a9d6073
03db3796886a
dedad73df1a9
5ff8ae9b1ce9

List all the docker images()
> docker images 
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
da-terraform                  c03-docker-e01      27fe7b902be9        5 hours ago         56MB
<none>                        <none>              e78452e58abe        5 hours ago         72.2MB
exercise02                    v2                  f57b5e7386f2        17 hours ago        107MB
raghunadhp/raghusdockerrepo   exercise02v2        f57b5e7386f2        17 hours ago        107MB
exercise02                    v1                  262a71ae5672        17 hours ago        107MB
raghunadhp/raghusdockerrepo   exercise02v1        262a71ae5672        17 hours ago        107MB
alpine                        latest              a24bb4013296        7 weeks ago         5.57MB
httpd                         2.4.41-alpine       54b0995a6305        3 months ago        107MB

> docker rmi  -f $(docker images   -aq)
Untagged: da-terraform:c03-docker-e01
Deleted: sha256:27fe7b902be9eb3d7f64c446bfa6922c2f7f5f91557bd71a5e3b39db527a85c2
Deleted: sha256:4c94df41bfe14ced9becf8459c33549c853dca59dc4199cdce8deaa181e72366
Deleted: sha256:3eff1fcc5c26fd6f456f9cf04b0544cb06aaca56f1eb841bb2194ccc03ac5797
Deleted: sha256:e78452e58abe1f5920c641ebe53953a6b18d01f093e66160d80a913dd66d1ba5
Deleted: sha256:9f1c4ee25303c0800fa3dd2127dd5493655f398d16511720c7e114ed3a0245b0
Deleted: sha256:8077e51aa398906adf229e8d3baac747c84b04842b7f1fe8bc0f37a7e43c961e
Deleted: sha256:ba2b2c0d6ac2ed88f68d725e2e979bedb0180fd05b9c74d6f41a0897981d8026
Deleted: sha256:952c199aa07642ad0ee19f6cc50c57a989eeaa12598317c3d44b85ba6f90cdc9
Deleted: sha256:b6f507cccf4a2c4addd2eee7607cea9556caa2d9e6c938c99f36749e32060804
Untagged: exercise02:v2
Untagged: raghunadhp/raghusdockerrepo:exercise02v2
Untagged: raghunadhp/raghusdockerrepo@sha256:1d65b49567735c7c117a6968457f6b4b24a2d0a5a29b857c5f83119eeff2579a
Deleted: sha256:f57b5e7386f23cb17e29bd0d9bed9f0072519487b2d460382b3bd74ef1418c96
Deleted: sha256:0ae94e2800d68400ae3b6fec94e5917d5a9b6a8d912de4ab8130a9a5cae0a017
Deleted: sha256:8ca1447b8461ab78819932c23143b21a416987718076dcb5a4b513e2aaff361c
Untagged: exercise02:v1
Untagged: raghunadhp/raghusdockerrepo:exercise02v1
Untagged: raghunadhp/raghusdockerrepo@sha256:d24833aebba57f152a651ff1a230a74ed1cfefceb6dcacd4174afa1adb9c1e61
Deleted: sha256:262a71ae567238ffd6ad5171f94fe91db8cc53699e5f7a416ef35c877dcaa428
Deleted: sha256:38f956d4b21fae09cf59a9576b5a8ee2e9ef5eac9d2756a51fca7b7944a98dc7
Deleted: sha256:c9fe9be0122f86c5a91debf4e1c03f719c5eaaf71aa09b49a28efdb75e52051f
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
Error: No such image: 4c94df41bfe1
Error: No such image: 8077e51aa398
Error: No such image: 952c199aa076
Error response from daemon: conflict: unable to delete 0ae94e2800d6 (cannot be forced) - image has dependent child images
Error: No such image: f57b5e7386f2
Error: No such image: 262a71ae5672
Error: No such image: 38f956d4b21f

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
No containers running (running or exited)
> docker container ls -a 
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

All the images deleted 
>  docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)