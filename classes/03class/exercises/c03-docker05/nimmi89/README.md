# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
$ docker run -itd  netizen89/exercise02:v1
Unable to find image 'netizen89/exercise02:v1' locally
v1: Pulling from netizen89/exercise02
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
c63497fc2d39: Pull complete
Digest: sha256:9d890dc56883324ca621fc292adc80c89d884e052527339465e66de83294df09
Status: Downloaded newer image for netizen89/exercise02:v1
da11217151c4d114c2de06934258327b2495936da6beee1e1a713db16fca6fa5

$ docker run -itd  netizen89/exercise02:v2
Unable to find image 'netizen89/exercise02:v2' locally
v2: Pulling from netizen89/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
2639d3339c37: Pull complete
Digest: sha256:07e010b7d1932e4fe9cede4192ba54a580436bc1e032c6269860072e9600be91
Status: Downloaded newer image for netizen89/exercise02:v2
f540a9f5893d4687ae1199a07f8c4bacce0a4f9edd54ebf357da0b2c951ee015

>To see if containers are up and running
$ docker ps -a
CONTAINER ID        IMAGE                     COMMAND              CREATED             STATUS              PORTS               NAMES
f540a9f5893d        netizen89/exercise02:v2   "httpd-foreground"   4 minutes ago       Up 4 minutes        80/tcp              festive_jackson
da11217151c4        netizen89/exercise02:v1   "httpd-foreground"   5 minutes ago       Up 5 minutes        80/tcp              affectionate_wu


```

- A brief explanation of what happened when you executed the comands to run the containers:
```
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon searched for the image locally.If it couldnt find it locally, it pulled the respective image tag from the Docker Hub. 
 3. The Docker daemon created a new container from that image by pulling file systems layers. Some of them were reused for the second scenario. 
 
```

- Command to list all images on your local as well as its output:
```
$ docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
netizen89/exercise02   v1                  f7f04bbc5d00        24 hours ago        107MB
netizen89/exercise02   v2                  8b521ef511ff        25 hours ago        107MB

```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)
