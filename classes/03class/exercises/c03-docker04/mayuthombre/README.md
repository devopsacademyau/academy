# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:

First we should check which containers are running at the moment.
```
docker ps

Output
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
As you can see here there are no containers running. Therefore, we need to check which images are being stored locally

```
docker images

Output
    REPOSITORY                                                        TAG              IMAGE ID       CREATED        SIZE
    817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   latest           f697a533ad34   16 hours ago   693MB
    weatherapp-ecrrepo                                                latest           f697a533ad34   16 hours ago   693MB
    817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   <none>           3a95872fcee8   17 hours ago   693MB
    817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   <none>           09f96558f654   21 hours ago   693MB
    mayuthombre/exercise02                                            v1               487a2743d4b1   22 hours ago   107MB
    h2breaker/exercise02                                              v1               487a2743d4b1   22 hours ago   107MB
    exercise02                                                        v1               487a2743d4b1   22 hours ago   107MB
    <none>                                                            <none>           d6db38ec2a4f   23 hours ago   107MB
    exercise02                                                        v2               3a52233efb06   23 hours ago   107MB
    h2breaker/exercise02                                              v2               3a52233efb06   23 hours ago   107MB
    <none>                                                            <none>           2d3eecff12cb   23 hours ago   107MB
    <none>                                                            <none>           5db162632881   23 hours ago   107MB
    da-terraform                                                      c03-docker-e01   bade9a1b61d2   24 hours ago   88.2MB
```
The "docker image prune" command allows you to clean up unused images. By default, docker image prune only cleans up dangling images.

```
docker image prune

Output
    WARNING! This will remove all dangling images.
    Are you sure you want to continue? [y/N] y
    Deleted Images:
    untagged: 817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo@sha256:41aebf5675026299b83d95341544866a69ef756a13f3f8274ce46c850d1fec65
    deleted: sha256:3a95872fcee89dd0290c038eb60ad2e1f8c03b6ebfba662d29a904c004a88253
    deleted: sha256:5db1626328812fbc192f0c8f453b0223dedbd5ba7f3868a972a0cc346d3f7cf7
    deleted: sha256:d6db38ec2a4faa24314a27a1acf89b9c245aa6c9de37cf27a2f53aac56f8e583
    untagged: 817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo@sha256:bd6c406a68509222c64217ffe54a182dfdd4318d859e1857f5f043dc966e9e25
    deleted: sha256:09f96558f654e0f08d60fd5d436272082dcc00640227d1c5a31ac3a59f95bb41
    deleted: sha256:2d3eecff12cb7f4912f44082c44cd508e75c0ce4cf974b1d4542775f3d620ba2
```

Again check which images are remains locally. Above commands only removes untagged images. Therefore, it will not remove the images created in the docker exercises thus far which had tags.

```
docker images

Output
    REPOSITORY                                                        TAG              IMAGE ID       CREATED        SIZE
    weatherapp-ecrrepo                                                latest           f697a533ad34   16 hours ago   693MB
    817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   latest           f697a533ad34   16 hours ago   693MB
    h2breaker/exercise02                                              v1               487a2743d4b1   22 hours ago   107MB
    exercise02                                                        v1               487a2743d4b1   22 hours ago   107MB
    mayuthombre/exercise02                                            v1               487a2743d4b1   22 hours ago   107MB
    h2breaker/exercise02                                              v2               3a52233efb06   23 hours ago   107MB
    exercise02                                                        v2               3a52233efb06   23 hours ago   107MB
    da-terraform                                                      c03-docker-e01   bade9a1b61d2   24 hours ago   88.2MB
```

To remove the tagged image we can make use of "docker image rm" command. It can remove one or more images. Lets look at this by tyring to remove mayuthombre/exercise02. You will need to first copy the image ID for the respective repository from the output above.

```
docker image rm -f 487a2743d4b1 (exercise02/v1 image) 

Output
    Untagged: h2breaker/exercise02:v1
    Untagged: h2breaker/exercise02@sha256:2867ef86236b3461f74f206980a3653d96d3760dcb87b2db0d59eae42c978a88
    Untagged: exercise02:v1
    Untagged: mayuthombre/exercise02:v1
    Deleted: sha256:487a2743d4b13d719f178076f97dea8ab8cb62a88bba7e53c1ab4c0097b281e5
```

Follow the same steps to remove other unwanted images created during docker exercise. And finally check which images remains locally.

```
docker image rm -f 3a52233efb06 (exercise02/v2 image)

Output
    Untagged: h2breaker/exercise02:v2
    Untagged: h2breaker/exercise02@sha256:b83ecd3bcadc2816ecf56fbc50a07e59dcfae32d4d7fc750c95b7b5002ac8ce5
    Untagged: exercise02:v2
    Deleted: sha256:3a52233efb06c3804fc466f4327a0e7ae8c56c3b680b15e8029b658cddcf1896

```



- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
docker images

Output
    817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   latest           f697a533ad34   16 hours ago   693MB
    weatherapp-ecrrepo                                                latest           f697a533ad34   16 hours ago   693MB
    da-terraform  
```


***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)