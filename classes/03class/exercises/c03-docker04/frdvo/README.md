# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
$ docker rmi -f $(docker images -a -q)
$ docker system prune --all --volumes
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
$ docker image ls --all
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

fer@ping:~$

$ docker ps --all
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS
NAMES

fer@ping:~$
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/READMEkl.md)