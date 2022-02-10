# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -it -p 8081:80 beardedsamwise/c03-docker03:v1
docker run -it --mount type=bind,src=/Users/sam.bentley@contino.io/Desktop/web,dst=/usr/local/apache2/htdocs -p 8082:80 beardedsamwise/c03-docker03:v2
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Both images were not found locally on my system so they were pulled from the remote repo (Docker Hub)
```

- Command to list all images on your local as well as its output:
```
$ docker images
REPOSITORY                    TAG       IMAGE ID       CREATED        SIZE
beardedsamwise/c03-docker03   v2        7dbad1c627a4   18 hours ago   107MB
beardedsamwise/c03-docker03   v1        0c52ba6ac9bd   18 hours ago   107MB
```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)