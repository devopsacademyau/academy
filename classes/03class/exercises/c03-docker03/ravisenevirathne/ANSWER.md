# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
Aravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: ravisenevirathne
Password: 
Login Succeeded

Logging in with your password grants your terminal complete access to your account. 
For better security, log in with a limited-privilege personal access token. Learn more at https://docs.docker.com/go/access-tokens/

ravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker tag excercise02:v1 ravisenevirathne/c03-docker03:v1
ravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker push ravisenevirathne/c03-docker03:v1
The push refers to repository [docker.io/ravisenevirathne/c03-docker03]
96a08e2ffd77: Pushed 
da8b1af5d0b7: Mounted from library/httpd 
93203cf3884d: Mounted from library/httpd 
4d98b137a090: Mounted from library/httpd 
e77842cc6cf9: Mounted from library/httpd 
294ac687b5fc: Mounted from library/httpd 
v1: digest: sha256:2b348dab190654fc7125fbb0c288887b34ac9e7ead2f30008c789c74a2fb6a66 size: 1569

ravi.senevirathne@contino.io@Ravis-MacBook-Pro academy % docker push ravisenevirathne/c03-docker03:v2              
The push refers to repository [docker.io/ravisenevirathne/c03-docker03]
f31a0821427b: Pushed 
da8b1af5d0b7: Layer already exists 
93203cf3884d: Layer already exists 
4d98b137a090: Layer already exists 
e77842cc6cf9: Layer already exists 
294ac687b5fc: Layer already exists 
v2: digest: sha256:8c2138f53f2db19173984ee48bdb86d91de889894997866c0518f9f3cd22f62d size: 1569



```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)