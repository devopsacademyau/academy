# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```

#Retagged these to fit them in my private repo (I'll delete these later and didn't want them on a public repo against my account)
> docker image tag exercise02:v1 x3point14x/home:c03-docker-03-exercise02-v1 
> docker image tag exercise02:v2 x3point14x/home:c03-docker-03-exercise02-v2 

# Pushed the images to dockerhub home repo
❯ docker image push x3point14x/home:c03-docker-03-exercise02-v1
The push refers to repository [docker.io/x3point14x/home]
f729c2430b93: Pushed 
8e24b43b535f: Mounted from library/httpd 
1dfb4a5d0ecd: Mounted from library/httpd 
3313c0c04ade: Mounted from library/httpd 
310889822143: Mounted from library/httpd 
beee9f30bc1f: Mounted from library/httpd 
c03-docker-03-exercise02-v1: digest: sha256:8123572dfb83823974ac8569981601d6a37feeec244d02533e16d0e5c9cb542c size: 1569

❯ docker image push x3point14x/home:c03-docker-03-exercise02-v2
The push refers to repository [docker.io/x3point14x/home]
8ff92392b024: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
c03-docker-03-exercise02-v2: digest: sha256:a6da5cc16bc0f41bbf88b93267a6ff5e4e6c27301d28d01f91680108a354febc size: 1569

```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)