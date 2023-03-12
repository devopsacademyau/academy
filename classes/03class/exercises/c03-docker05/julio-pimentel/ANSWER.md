# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
$ docker pull juliopimentel/exercise02:v1
$ docker pull juliopimentel/exercise02:v2
$ docker run -d -p 8081:80 juliopimentel/exercise02:v1
f0d7322334179cc2e0f348ca68d51e1a80b1d7be25d013ad7c0c11b2e86bd415

$ curl localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

$ docker run -dit --rm -p 8082:80 -v "${PWD}/../../../docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/" juliopimentel/exercise02:v2
c0c3b53e517da859c7d6e9cb1f0b04d04ddc0ba529267466e20d57049d184d7b

$ curl localhost:8082
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /</title>
 </head>
 <body>
<h1>Index of /</h1>
<ul></ul>
</body></html>
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
The containers ran exactly the same as before pushed the Docker images. It is what is expected when running a container. 
```

- Command to list all images on your local as well as its output:
```
$ docker images 
REPOSITORY                 TAG       IMAGE ID       CREATED             SIZE
juliopimentel/exercise02   v2        547bc0b2e60f   About an hour ago   107MB
juliopimentel/exercise02   v1        096fecbd2d9e   About an hour ago   107MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)