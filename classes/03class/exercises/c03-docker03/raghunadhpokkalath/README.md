# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
Tag webserver v1 
docker tag exercise02:v1 raghunadhp/raghusdockerrepo:exercise02v1

Push the docker image to dockerhub

> docker push raghunadhp/raghusdockerrepo:exercise02v1

The push refers to repository [docker.io/raghunadhp/raghusdockerrepo]
3f2e7b1882ed: Pushed 
8e24b43b535f: Pushed 
1dfb4a5d0ecd: Pushed 
3313c0c04ade: Pushed 
310889822143: Pushed 
beee9f30bc1f: Pushed 
exercise02v1: digest: sha256:d24833aebba57f152a651ff1a230a74ed1cfefceb6dcacd4174afa1adb9c1e61 size: 1569


> docker tag exercise02:v2 raghunadhp/raghusdockerrepo:exercise02v2
Push the docker image 

> docker push raghunadhp/raghusdockerrepo:exercise02v2
 docker push raghunadhp/raghusdockerrepo:exercise02v2

The push refers to repository [docker.io/raghunadhp/raghusdockerrepo]
3f2e7b1882ed: Layer already exists 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
exercise02v2: digest: sha256:d24833aebba57f152a651ff1a230a74ed1cfefceb6dcacd4174afa1adb9c1e61 size: 1569
```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)