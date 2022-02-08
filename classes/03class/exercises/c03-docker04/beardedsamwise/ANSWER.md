# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
# kill all running containers
docker kill $(docker ps -q) 
# remove all exited/killed containers
docker rm $(docker ps -a -q)
# remove all images
docker rmi $(docker images -q)
# force removal of remaining images due to error: unable to delete 7dbad1c627a4 (must be forced) - image is referenced in multiple repositories
docker rmi $(docker images -q) -f
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
$ docker ps --all
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)