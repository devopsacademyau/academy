# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
docker tag 9ca010508525 cyberjames/c03-docker03:v1

docker push cyberjames/c03-docker03:v1
The push refers to repository [docker.io/cyberjames/c03-docker03]
b28586d146c7: Pushed
da8b1af5d0b7: Mounted from library/httpd
93203cf3884d: Mounted from library/httpd
4d98b137a090: Mounted from library/httpd
e77842cc6cf9: Mounted from library/httpd
294ac687b5fc: Mounted from library/httpd
v1: digest: sha256:428476d89f35f4b6b0c468103474417cc78db1cfdd0dd58f5f3b4022ed66662e size: 1569
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)