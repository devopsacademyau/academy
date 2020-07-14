# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
## Dockerfile V1

$ docker build -t exercise02:v1 -f Dockerfile.v1 .

$ docker run -d -p 8081:80 exercise02:v1
d2b3cd670fe21136e7ed5f3675590886f7ba65b1803e19a3677efbe16a621327


$ curl http://localhost:8081 

Content           : <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

## Dockerfile V2

$ docker build -t exercise02:v2 -f Dockerfile.v2 .

$ docker run -p 8082:80 exercise02:v2

docker run -d -p 8082:80 \
    --name devtest \
    --mount type=bind,source="C:/Users/rramy/Desktop/Devopsacademy/academy/classes/03class/docker/artifacts/c03-docker02/,target=/usr/local/apache2/" \
    htdocs/ exercise02:v2
e1546a000d7e8aff68e4410147f290fda3d20a8fe64449ac53e468e2d66b8e23

$ curl http://localhost:8082 

Content           : <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

## Listing the container 
$ docker ps                  
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS
 NAMES
e1546a000d7e        exercise02:v2       "httpd-foreground"   21 minutes ago      Up 21 minutes       0.0.0.0:8082->80/tcp  
 devtest
d2b3cd670fe2        exercise02:v1       "httpd-foreground"   18 hours ago        Up 18 hours         0.0.0.0:8081->80/tcp  
 pensive_cray

```

- Curl command and its output of after changing the image:
```

$ curl http://localhost:8082
Content           : <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

                    <h2> Its automation, not automagic </h2>

```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
* The index.html file was pre-baked in Dockerfile.v1 image during the Dockerfile.v1 build
* The index.html file was mount during exercise02:v2

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)