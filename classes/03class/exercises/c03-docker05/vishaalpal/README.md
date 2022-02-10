# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run --name Dockercontainerv1 -p 8081:80 exercise02:v1
docker run --name Dockercontainerv2 -p 8082:80 exercise02:v2
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker attempted to create a container searching for an image on my local filesystem which was unsuccessful. 
Docker then searched DockerHub for the specific repository name and image which was successful. 
Upon finding these images on DockerHub, they were downloaded locally and then used to launch the two containers.  
```

- Command to list all images on your local as well as its output:
```
docker image ls -a
REPOSITORY                       TAG             IMAGE ID       CREATED       SIZE
vee94/vishaalpal-docker-images   exercise02-v1   032a24cc4e91   6 hours ago   107MB
vee94/vishaalpal-docker-images   exercise02-v2   f440a14fb8bb   6 hours ago   107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)

