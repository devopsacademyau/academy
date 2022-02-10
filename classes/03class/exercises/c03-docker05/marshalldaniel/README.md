# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -d -p 8081:80 marshalldaniel/exercise02:v1
docker run -d -p 8082:80 marshalldaniel/exercise02:v2
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker attempted to run the container from an image locally but could not find one. It then looked on DockerHub for the specified repo and image, found it and then pulled it locally. Once the image was pulled, it ran a container using the command specified.
```

- Command to list all images on your local as well as its output:
```
docker image ls
REPOSITORY                  TAG       IMAGE ID       CREATED        SIZE
marshalldaniel/exercise02   v2        336030bc4e87   23 hours ago   107MB
marshalldaniel/exercise02   v1        7cf2f980d4af   24 hours ago   107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)