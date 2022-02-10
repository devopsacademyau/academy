# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -it -p 8081:80 ravisenevirathne/c03-docker03:v1
docker run -it -v /Users/ravi.senevirathne@contino.io/DevOps/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -p 8082:80 ravisenevirathne/c03-docker03:v2


```

- A brief explanation of what happened when you executed the comands to run the containers:
```
First docker is trying find these images locally. It it cannnot them locally, it will download from Dockerhub and will run it.
```

- Command to list all images on your local as well as its output:
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker images
REPOSITORY                      TAG       IMAGE ID       CREATED       SIZE
ravisenevirathne/c03-docker03   v2        38f863f8c098   5 hours ago   107MB
ravisenevirathne/c03-docker03   v1        cc53838bb62f   6 hours ago   107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)