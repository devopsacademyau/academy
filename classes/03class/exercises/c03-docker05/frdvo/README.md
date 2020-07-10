# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
$ docker run --publish 8081:80 frdvo/exercise02:v1
$ docker run --publish 8082:80 --volume /home/fer/repos/academy/classes/03class/docke
r/artifacts/c03-docker02:/usr/local/apache2/htdocs frdvo/exercise02:v2
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
The first container has pulled all layers from the container registry, whereas the second has skipped the layers I already had on my system.
```

- Command to list all images on your local as well as its output:
```
$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
frdvo/exercise02    v2                  b7a94f736c38        About an hour ago   107MB
frdvo/exercise02    v1                  b4ca1e2a7ded        2 hours ago         107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)