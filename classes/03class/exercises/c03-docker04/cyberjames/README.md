# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
# The command below will LIST all the running containers filtered by the containers ID and will execute to stop running containers. 
# After that, it will then removed.
$ docker ps -aq | xargs docker stop | xargs docker rm

# The command below will remove all docker images in the list filtered by container ID. 
$ docker rmi $(docker images -aq) -f

# The command below will forcely removed the remaining images due to the error message - unable to delete 9ca010508525.
$ docker rmi $(docker images -aq) -f

```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
# The commands below will show all containers.
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

# The commands below will show all container images.
$ docker images -a
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)