# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
docker login --username=mfreitassm                              

Password: 
WARNING! Your password will be stored unencrypted in /home/mfreitas/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

docker tag exercise02:v1 mfreitassm/devopsacademy:v1
docker push mfreitassm/devopsacademy:v1
The push refers to repository [docker.io/mfreitassm/devopsacademy]
db6ac8bbd7eb: Pushed 
8e24b43b535f: Mounted from library/httpd 
1dfb4a5d0ecd: Mounted from library/httpd 
3313c0c04ade: Mounted from library/httpd 
310889822143: Mounted from library/httpd 
beee9f30bc1f: Mounted from library/httpd 
v1: digest: sha256:26f917769736a9257687038ba760c2ad2cc7ecf902a9f8d72eb111ebc773f452 size: 1569

docker tag exercise02:v2 mfreitassm/devopsacademy:v2
docker push mfreitassm/devopsacademy:v2
The push refers to repository [docker.io/mfreitassm/devopsacademy]
d74ac5809149: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
v2: digest: sha256:0c1e6acfaab9f6216af2773f168dbb7faa498ce741886fa94bde0866baa1af4e size: 1569
```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)