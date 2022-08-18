# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -it -p 8081:80 cyberjames/c03-docker03:v1

docker run -it --mount type=bind,source=/Users/james.corteciano@contino.io/github/academy/classes/03class/docker/artifacts/c03-docker02,target=/usr/local/apache2/htdocs -p 8082:80 cyberjames/c03-docker03:v2
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
The docker image was unable to find it locally, so intead it goes to the docker hub.
```

- Command to list all images on your local as well as its output:
```
$ docker images
REPOSITORY                TAG       IMAGE ID       CREATED        SIZE
cyberjames/c03-docker03   v2        6wego9j373z4   1 hours ago   107MB
cyberjames/c03-docker03   v1        3kjt95k6986k   1 hours ago   107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)