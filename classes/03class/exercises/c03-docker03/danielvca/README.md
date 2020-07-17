
# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
❯ docker push danielvca/exercise02:v1  
The push refers to repository [docker.io/danielvca/exercise02]  
24fb8576069b: Pushed  
8e24b43b535f: Mounted from library/httpd  
1dfb4a5d0ecd: Mounted from library/httpd  
3313c0c04ade: Mounted from library/httpd  
310889822143: Mounted from library/httpd  
beee9f30bc1f: Mounted from library/httpd  
v1: digest: sha256:e37b2133eaf73ffc341b58e57c46a0cf2376513736101e8dcfd73e663cd5ac19 size: 1569

❯ docker push danielvca/exercise02:v2  
The push refers to repository [docker.io/danielvca/exercise02]  
4c90d7cd6580: Pushed  
8e24b43b535f: Layer already exists  
1dfb4a5d0ecd: Layer already exists  
3313c0c04ade: Layer already exists  
310889822143: Layer already exists  
beee9f30bc1f: Layer already exists  
v2: digest: sha256:5173328eb8395bde23bc48dfa76aab8d8b54228820061632e9e99f2c2a3ab62d size: 1569
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
