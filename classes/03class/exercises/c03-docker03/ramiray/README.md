# C03-Docker03

## Commands



- Commands executed to push both images to DockerHub as well as the output from those commands:
```
## Tag the images before pushing to DockerHub:

docker tag exercise02:v1 ramiray/dockerexe:exercise02v1
docker tag exercise02:v2 ramiray/dockerexe:exercise02v2

# Push the images to DockerHub

$ docker push ramiray/dockerexe:exercise02v1
The push refers to repository [docker.io/ramiray/dockerexe]
b706cb08026c: Layer already exists
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
exercise02v1: digest: sha256:3416d3615aa399d056096cfc30f08e6e36f9224703cfd0e195405a397fd7203c size: 1569

$ docker push ramiray/dockerexe:exercise02v2
The push refers to repository [docker.io/ramiray/dockerexe]
3a4972a7e062: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Mounted from library/httpd
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Layer already exists
exercise02v2: digest: sha256:41c9b030d98c01efc465b97b094ff7924eabd36325dc8a7cc9388347cc8a213b size: 1569

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)