# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -p 8081:80 -d confide/devopsacademy:v1
and
docker run -p 8082:80 -d confide/devopsacademy:v2
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker tried to find the image locally and was unable to. So it resorted to docker hub where it found the public images. It downloaded these based on the supplied tag and executed them.
```

- Command to list all images on your local as well as its output:
```
docker images -a                                 
REPOSITORY              TAG       IMAGE ID       CREATED             SIZE
confide/devopsacademy   v1        064bcbcb68c7   32 minutes ago      107MB
confide/devopsacademy   v2        50fa0e42f769   About an hour ago   107MB
```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)