# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
❯ docker run -dit x3point14x/home:c03-docker-03-exercise02-v1
Unable to find image 'x3point14x/home:c03-docker-03-exercise02-v1' locally
c03-docker-03-exercise02-v1: Pulling from x3point14x/home
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
dd9b9529acb9: Pull complete 
Digest: sha256:8123572dfb83823974ac8569981601d6a37feeec244d02533e16d0e5c9cb542c
Status: Downloaded newer image for x3point14x/home:c03-docker-03-exercise02-v1
e9b09da53005efb639c481a88b858d64bc0b9a28567db2afff7e4c48cc208f19

❯ docker run -dit x3point14x/home:c03-docker-03-exercise02-v2
Unable to find image 'x3point14x/home:c03-docker-03-exercise02-v2' locally
c03-docker-03-exercise02-v2: Pulling from x3point14x/home
aad63a933944: Already exists 
29ade582b51e: Already exists 
7e41ad5b6f9c: Already exists 
ebf61b47b4ca: Already exists 
9c060bce4eae: Already exists 
bba6fd8f1098: Pull complete 
Digest: sha256:a6da5cc16bc0f41bbf88b93267a6ff5e4e6c27301d28d01f91680108a354febc
Status: Downloaded newer image for x3point14x/home:c03-docker-03-exercise02-v2
b2b3c336772c6c173abe493a605730de26b68bbdd5d00dc976f979e832e43dd9

❯ docker ps -a
CONTAINER ID   IMAGE                                         COMMAND              CREATED              STATUS              PORTS     NAMES
b2b3c336772c   x3point14x/home:c03-docker-03-exercise02-v2   "httpd-foreground"   52 seconds ago       Up 51 seconds       80/tcp    wonderful_kapitsa
e9b09da53005   x3point14x/home:c03-docker-03-exercise02-v1   "httpd-foreground"   About a minute ago   Up About a minute   80/tcp    charming_mclean

```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker checked for a local copy of the images but did not see them, so it downloaded the images from my remote repo
```

- Command to list all images on your local as well as its output:
```
❯ docker image list
REPOSITORY               TAG                           IMAGE ID       CREATED        SIZE
x3point14x/home          c03-docker-03-exercise02-v2   07d01f98c33c   26 hours ago   107MB
x3point14x/home          c03-docker-03-exercise02-v1   aabb40248bda   26 hours ago   107MB
```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)