# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
$ docker image ls | grep exercise02

exercise02                                          v2                  7adc8b0b411c        About an hour ago   107MB
exercise02                                          v1                  4642026763e1        About an hour ago   107MB

docker tag 4642026763e1 obrientimothya/exercise02:v1

docker tag 7adc8b0b411c obrientimothya/exercise02:v2

docker login

Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: obrientimothya
Password:
Login Succeeded

docker push obrientimothya/exercise02:v1

The push refers to repository [docker.io/obrientimothya/exercise02]
2d2ab3d2c6dd: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Mounted from library/httpd
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Mounted from library/httpd
v1: digest: sha256:8e5e84b943a57045767b3c9f331f755b12d4570ff86d9ceb12fc3be6e26cb8bd size: 1569

docker push obrientimothya/exercise02:v2

The push refers to repository [docker.io/obrientimothya/exercise02]
75b4fa3cdda8: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
v2: digest: sha256:bbd626711373d8c34c714d84e917ef7f684393bbe7f791391f3cc7dce45a4abf size: 1569
```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
