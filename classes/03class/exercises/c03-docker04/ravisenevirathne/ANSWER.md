# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
#remove both running and stopped containers
docker rm $(docker ps -a -q)

#remove all docker images
docker rmi $(docker images -q)

#Also can use prune command to cleanup stopped containers
docker container prune

#Also can use prune command to remove all images not used by containers
docker image prune -a

Ref - https://typeofnan.dev/how-to-stop-all-docker-containers/
Ref  - https://docs.docker.com/config/pruning/

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

ravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker image ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)