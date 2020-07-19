# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -d -p 8081:80 carloshz4/exercise02:v1

Unable to find image 'carloshz4/exercise02:v1' locally
v1: Pulling from carloshz4/exercise02
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
da5028f3c176: Pull complete
Digest: sha256:780aa1a6a4db5adbbf81dbf8ac79656d7ff86c4c0ae1680b39aaf0b38f334e33
Status: Downloaded newer image for carloshz4/exercise02:v1
55edbb3392b613a9da2df306a539a4cfe9e4be6c575b397560bd9be0d1ef48c5


docker run -d -p 8082:80 -v /root/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ carloshz4/exercise02:v2

Unable to find image 'carloshz4/exercise02:v2' locally
v2: Pulling from carloshz4/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
50917e58859c: Pull complete
Digest: sha256:e4fbe86cc627fd9ab47e627f3935261a429a5a375ce6d9f57fb446eb8b0f8a7e
Status: Downloaded newer image for carloshz4/exercise02:v2
20a7e5f58baf8a8a72bbdc7802b1880be2bf8e406aeb92b631798f19b0c15ff9
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
The images were not found locally so the were fetched from my dockerhub account, and then the containers created with those locally.

For the second image, it reused layers of the first image as they are both based from the same http image.
```

- Command to list all images on your local as well as its output:
```
docker images
REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
carloshz4/exercise02   v2                  5a445065cb2e        26 hours ago        107MB
carloshz4/exercise02   v1                  3f38bd842238        27 hours ago        107MB

docker ps
CONTAINER ID        IMAGE                     COMMAND              CREATED              STATUS              PORTS                  NAMES
20a7e5f58baf        carloshz4/exercise02:v2   "httpd-foreground"   About a minute ago   Up About a minute   0.0.0.0:8082->80/tcp   focused_heisenberg
55edbb3392b6        carloshz4/exercise02:v1   "httpd-foreground"   2 minutes ago        Up 2 minutes        0.0.0.0:8081->80/tcp   dazzling_carson
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)