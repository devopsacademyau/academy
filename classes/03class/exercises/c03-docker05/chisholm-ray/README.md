# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker run -dit conorcr/exercise02:v1
Unable to find image 'conorcr/exercise02:v1' locally
v1: Pulling from conorcr/exercise02
9b3977197b4f: Already exists 
5d9e1f412841: Already exists 
55c32d614302: Already exists 
f09380cbcdb7: Already exists 
e5dbfbe5ef51: Already exists 
15d45afd13ac: Already exists 
49f35016fedb: Already exists 
Digest: sha256:7108518c63ea11426592a171a25afc2379712ce873ba5ba203479eb72a1411ee
Status: Downloaded newer image for conorcr/exercise02:v1
42902b46b43af14ae39e4010c3513612e6d3d21fa0213105d6c7ed77503e0373
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker run -dit conorcr/exercise02:v2
Unable to find image 'conorcr/exercise02:v2' locally
v2: Pulling from conorcr/exercise02
9b3977197b4f: Already exists 
5d9e1f412841: Already exists 
55c32d614302: Already exists 
f09380cbcdb7: Already exists 
e5dbfbe5ef51: Already exists 
15d45afd13ac: Already exists 
1acc03a10b10: Already exists 
Digest: sha256:c8873cca97ecaa7a0f21ae0a53c6e362fdbd92700319c994e3e3e8988a972b3c
Status: Downloaded newer image for conorcr/exercise02:v2
db028c50986ea60e3046ccd4515d0fb2152459b4feabd0216123afad352a9809
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker ps
CONTAINER ID   IMAGE                   COMMAND              CREATED          STATUS          PORTS     NAMES
db028c50986e   conorcr/exercise02:v2   "httpd-foreground"   24 seconds ago   Up 23 seconds   80/tcp    peaceful_benz
42902b46b43a   conorcr/exercise02:v1   "httpd-foreground"   37 seconds ago   Up 36 seconds   80/tcp    romantic_elion

```

- A brief explanation of what happened when you executed the comands to run the containers:
```
docker checked for local copy of the image, could not find it so downloaded latest images from my dockerhub repository
```

- Command to list all images on your local as well as its output:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro academy % docker image ls
REPOSITORY           TAG              IMAGE ID       CREATED        SIZE
conorcr/exercise02   v2               6f6e8f012fe1   18 hours ago   57MB
conorcr/exercise02   v1               8bada15d8d8d   18 hours ago   57MB
<none>               <none>           37764f9fad4e   19 hours ago   55.8MB
<none>               <none>           7bf411e919ae   19 hours ago   55.8MB
<none>               <none>           59fb75ca2555   19 hours ago   55.8MB
da-terraform         c03-docker-e01   39aa55e96f68   19 hours ago   55.8MB
```


***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)