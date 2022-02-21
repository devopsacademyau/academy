# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
➜  jaysues git:(jaysues/c03-docker05) ✗ docker pull jaysuesdocker/c03e03:exercise02v1
exercise02v1: Pulling from jaysuesdocker/c03e03
9b3977197b4f: Pull complete 
5d9e1f412841: Pull complete 
55c32d614302: Pull complete 
f09380cbcdb7: Pull complete 
e5dbfbe5ef51: Pull complete 
15d45afd13ac: Pull complete 
f73d732bde54: Pull complete 
Digest: sha256:cbfe3e2c1f81bde4d565cd27c9ce9539227380d66b642f75927e16c35e7ac6da
Status: Downloaded newer image for jaysuesdocker/c03e03:exercise02v1
docker.io/jaysuesdocker/c03e03:exercise02v1
➜  jaysues git:(jaysues/c03-docker05) ✗ docker pull jaysuesdocker/c03e03:exercise02v2
exercise02v2: Pulling from jaysuesdocker/c03e03
9b3977197b4f: Already exists 
5d9e1f412841: Already exists 
55c32d614302: Already exists 
f09380cbcdb7: Already exists 
e5dbfbe5ef51: Already exists 
15d45afd13ac: Already exists 
123b585b4b67: Pull complete 
Digest: sha256:2938605aa85b15275344cbbcfb4d30484513ee1e3f9991dd41c91c68890c392e
Status: Downloaded newer image for jaysuesdocker/c03e03:exercise02v2
docker.io/jaysuesdocker/c03e03:exercise02v2
➜  jaysues git:(jaysues/c03-docker05) ✗ docker run -d -p 8081:80 jaysuesdocker/c03e03:exercise02v1 
0f2fd2d0af3f1036d6950d214d9fd1ba95f703799d6970975d76fc585dc6d6ad
➜  jaysues git:(jaysues/c03-docker05) ✗ docker run -v ~/Documents/DevopsAcademy/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -d -p 8082:80 jaysuesdocker/c03e03:exercise02v2
9d9570a00961758ff28c3496b28947bdc951fc40eb44cf543e7fbe26b9490b8e
➜  jaysues git:(jaysues/c03-docker05) ✗ curl http://localhost:8081

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
➜  jaysues git:(jaysues/c03-docker05) ✗ curl http://localhost:8082

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
➜  jaysues git:(jaysues/c03-docker05) ✗ 
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
They pulled the required information from Docker Hub then used it to make a local image. I then used docker run to create a container from each image as per usual.
```

- Command to list all images on your local as well as its output:
```
➜  jaysues git:(jaysues/c03-docker05) ✗ docker images -a

REPOSITORY             TAG            IMAGE ID       CREATED       SIZE
jaysuesdocker/c03e03   exercise02v2   534839de86cc   11 days ago   57MB
jaysuesdocker/c03e03   exercise02v1   9d535f213fb7   11 days ago   57MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)