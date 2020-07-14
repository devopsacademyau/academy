# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
$ docker login
Entered the docker hub credentials

$ docker tag exercise02:v1 netizen89/exercise02:v1

$ docker push netizen89/exercise02:v1
The push refers to repository [docker.io/netizen89/exercise02]
6ba49097bd36: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Pushed
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Mounted from library/httpd
v1: digest: sha256:9d890dc56883324ca621fc292adc80c89d884e052527339465e66de83294df09 size: 1569


$ docker tag exercise02:v2 netizen89/exercise02:v2

$ docker push netizen89/exercise02:v2
The push refers to repository [docker.io/netizen89/exercise02]
e4ed4c919ed4: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
v2: digest: sha256:07e010b7d1932e4fe9cede4192ba54a580436bc1e032c6269860072e9600be91 size: 1569

```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
