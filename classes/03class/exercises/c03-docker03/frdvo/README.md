# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
$ docker login
Authenticating with existing credentials...
Login Succeeded

$ docker tag exercise02:v1 frdvo/exercise02:v1

$ docker push frdvo/exercise02:v1
The push refers to repository [docker.io/frdvo/exercise02]
d18ef0940d8a: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Pushed
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Mounted from library/httpd
v1: digest: sha256:82d8263fd2d34fa74db2e412b2155043912e10115db04ce3e3606e30bd18c54e size: 1569

$ docker tag exercise02:v2 frdvo/exercise02:v2

$  docker push frdvo/exercise02:v2
The push refers to repository [docker.io/frdvo/exercise02]
4acc734f9dbd: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
v2: digest: sha256:7035340f7a981037c07d1fa1160b2543fd2f02c69ef58488a1675fc4c9d22096 size: 1569

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)