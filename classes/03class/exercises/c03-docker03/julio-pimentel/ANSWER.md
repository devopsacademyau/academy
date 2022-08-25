# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
$ docker login 

$ docker tag 096fecbd2d9e juliopimentel/exercise02:v1
$ docker push juliopimentel/exercise02:v1
The push refers to repository [docker.io/juliopimentel/exercise02]
3b75ea473412: Pushed 
09dfd4582b2b: Pushed 
8e24b43b535f: Pushed 
1dfb4a5d0ecd: Pushed 
3313c0c04ade: Pushed 
310889822143: Pushed 
beee9f30bc1f: Pushed 
v1: digest: sha256:08345dfb077f1b8cc7abd15632bb8792c56d260a2318cc5ad4df821436183149 size: 1776

$ docker tag exercise02:v2 juliopimentel/exercise02:v2
$ docker push juliopimentel/exercise02:v2
The push refers to repository [docker.io/juliopimentel/exercise02]
676405d7684b: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
v2: digest: sha256:67eb11f2a5e58b0a9ed6ae7d2bfedc16d266266e0a3afcffcb0c3296165635f5 size: 1569

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)