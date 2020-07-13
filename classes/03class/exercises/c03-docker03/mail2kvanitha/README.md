# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
 LIST DOCKER IMAGES:
 >  docker images
   REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
   exercise02                    v2                  e0694673648f        46 hours ago        107MB
   exercise02                    v1                  bda9d1507076        46 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker01        c50fc0cc7915        2 days ago          56MB
   da-terraform                  c03-docker-e01      c50fc0cc7915        2 days ago          56MB

 > docker tag bda9d1507076 mail2kvanitha/devopsacademy:c03-docker03-e01
 
 > docker push mail2kvanitha/devopsacademy:c03-docker03-e01
   The push refers to repository [docker.io/mail2kvanitha/devopsacademy]
   4d3d0f43a95e: Pushed 
   8e24b43b535f: Mounted from library/httpd 
   1dfb4a5d0ecd: Mounted from library/httpd 
   3313c0c04ade: Mounted from library/httpd 
   310889822143: Mounted from library/httpd 
   beee9f30bc1f: Mounted from library/httpd 
   c03-docker03-e01: digest: sha256:49280b69871b86f2b58826a0bd152525261acde0f76f25286aba67e96cb2d099 size: 1569

 > docker tag e0694673648f mail2kvanitha/devopsacademy:c03-docker03-e02
 
 > docker push mail2kvanitha/devopsacademy:c03-docker03-e02
   The push refers to repository [docker.io/mail2kvanitha/devopsacademy]
   533e8f9b6b52: Pushed 
   8e24b43b535f: Layer already exists 
   1dfb4a5d0ecd: Layer already exists 
   3313c0c04ade: Layer already exists 
   310889822143: Layer already exists 
   beee9f30bc1f: Layer already exists 
   c03-docker03-e02: digest: sha256:03abf1864a5074f37aacac9ddd67f482e4126b94803455e7b4a73fe60920bcf3 size: 1569

 > docker images
   REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
   exercise02                    v2                  e0694673648f        46 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker03-e02    e0694673648f        46 hours ago        107MB
   exercise02                    v1                  bda9d1507076        46 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker03-e01    bda9d1507076        46 hours ago        107MB
   mail2kvanitha/devopsacademy   c03-docker01        c50fc0cc7915        2 days ago          56MB
   da-terraform                  c03-docker-e01      c50fc0cc7915        2 days ago          56MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
