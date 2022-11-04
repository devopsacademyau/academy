# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
docker push confide/devopsacademy:v1                           
The push refers to repository [docker.io/confide/devopsacademy]
4b77cf742dab: Pushed 
da8b1af5d0b7: Mounted from library/httpd 
93203cf3884d: Mounted from library/httpd 
4d98b137a090: Mounted from library/httpd 
e77842cc6cf9: Mounted from library/httpd 
294ac687b5fc: Mounted from library/httpd 
v1: digest: sha256:f11a1fad097ada7cc878a1a5e12f97a57852c490cbc3fdc3c1551d9132cae5c8 size: 1569

docker push confide/devopsacademy:v2
The push refers to repository [docker.io/confide/devopsacademy]
783cb34fe0e0: Pushed 
da8b1af5d0b7: Layer already exists 
93203cf3884d: Layer already exists 
4d98b137a090: Layer already exists 
e77842cc6cf9: Layer already exists 
294ac687b5fc: Layer already exists 
v2: digest: sha256:64323b18dae0a226731d103910da3580563e84b1599715b9de10035effab6507 size: 1569
```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)