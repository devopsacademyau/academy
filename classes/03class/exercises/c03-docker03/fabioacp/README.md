# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```

❯ docker login -u facp    
Password: 
Login Succeeded

❯ docker image tag exercise02:v1 facp/exercise02:v1

❯ docker image push facp/exercise02:v1             
The push refers to repository [docker.io/facp/exercise02]
d3df08571c0e: Pushed 
8e24b43b535f: Mounted from library/httpd 
1dfb4a5d0ecd: Mounted from library/httpd 
3313c0c04ade: Mounted from library/httpd 
310889822143: Mounted from library/httpd 
beee9f30bc1f: Mounted from library/httpd 
v1: digest: sha256:babbe881af088549b6f6645a0751a911e172c4df42541acd5f06d8f3e2c77f2c size: 1569

❯ docker image tag exercise02:v2 facp/exercise02:v2

❯ docker image push facp/exercise02:v2             
The push refers to repository [docker.io/facp/exercise02]
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
v2: digest: sha256:007c7d4ba3d9a1d92209d4cc545607c6b72f58ba2b104f1caf309428d770680a size: 1362

```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)