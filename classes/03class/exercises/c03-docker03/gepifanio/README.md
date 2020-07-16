# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
docker tag ae3f673ae115 guiepifanio/exercise02:v1
docker push guiepifanio/exercise02:v1

The push refers to repository [docker.io/guiepifanio/exercise02]
54439510d121: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Mounted from library/httpd
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Mounted from library/httpd
v1: digest: sha256:1a8773da5c34898fbf2b31bcf92f9d30fe87799463f0423444b76aadabb9dd6d size: 1569

docker tag e0256558b30d guiepifanio/exercise02:v2
docker push guiepifanio/exercise02:v2

The push refers to repository [docker.io/guiepifanio/exercise02]
81ecdbe7daa9: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Pushing [=>                                                 ]   2.71MB/101.8MB
3313c0c04ade: Layer already exists
1dfb4a5d0ecd: Pushed
beee9f30bc1f: Pushed
v2: digest: sha256:b659c7fb10f86923d4bdb59a1366b4e425eceb85b7b2ba0b8e6dad1b217a1888 size: 1569

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)