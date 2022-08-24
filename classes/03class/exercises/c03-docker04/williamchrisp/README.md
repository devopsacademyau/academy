# C03-Docker04

## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
To show all containers and status.
docker ps -a

To stop all containers by using docker ps -aq to grab only ids.
docker stop $(docker ps -aq)

To remove all containers in similar method
docker rm $(docker ps -aq)

To show all images
docker images -a

To delete all images via the ids
docker rmi $(docker images -q)
```


- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
To show all containers and status.
docker ps -a                  
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

To show all images
docker images -a              
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)