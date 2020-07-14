
- Commands executed to run both containers:
```
$ docker run -dp 8081:80  ramiray/dockerexe:exercise02v1
Unable to find image 'ramiray/dockerexe:exercise02v1' locally
exercise02v1: Pulling from ramiray/dockerexe
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
c9daec387592: Pull complete
Digest: sha256:3416d3615aa399d056096cfc30f08e6e36f9224703cfd0e195405a397fd7203c
Status: Downloaded newer image for ramiray/dockerexe:exercise02v1
60537102bbb3fe331e7f40f2454bb6dbba7d48f4cee2d9509116cd023602cbd7

$ docker run -dp 8082:80 ramiray/dockerexe:exercise02v2
Unable to find image 'ramiray/dockerexe:exercise02v2' locally
exercise02v2: Pulling from ramiray/dockerexe
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
e9ed875023c2: Pull complete
Digest: sha256:41c9b030d98c01efc465b97b094ff7924eabd36325dc8a7cc9388347cc8a213b
Status: Downloaded newer image for ramiray/dockerexe:exercise02v2
e9b3b14139883cc1121e18d35e42f04d3af154d9e4341a5a6262842ac139d31a

$ docker ps
CONTAINER ID        IMAGE                            COMMAND              CREATED              STATUS              PORTS                  NAMES
e9b3b1413988        ramiray/dockerexe:exercise02v2   "httpd-foreground"   34 seconds ago       Up 33 seconds       0.0.0.0:8082->80/tcp   naughty_cray
60537102bbb3        ramiray/dockerexe:exercise02v1   "httpd-foreground"   About a minute ago   Up About a minute   0.0.0.0:8081->80/tcp   frosty_nightingale


```

- A brief explanation of what happened when you executed the comands to run the containers:
```
When the command is executed, it is trying to find the image locally .Since its unable to find the image it is fetching from the hub. 
```

- Command to list all images on your local as well as its output:
```
# Changing the Tag to requested format in the question:  yourdockerhubuser/exercise02:v1 
$ docker image tag ramiray/dockerexe:exercise02v1 ramiray/exercise02:v1
$ docker image tag ramiray/dockerexe:exercise02v2 ramiray/exercise02:v2

$ docker image ls
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
ramiray/dockerexe    exercise02v2        e19f591b256d        5 hours ago         107MB
ramiray/exercise02   v2                  e19f591b256d        5 hours ago         107MB
ramiray/dockerexe    exercise02v1        aaf6890d1de5        23 hours ago        107MB
ramiray/exercise02   v1                  aaf6890d1de5        23 hours ago        107MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)