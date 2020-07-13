# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
z@bacon:~/Documents/GitHub/academy$ docker build -t exercise02:v1 -f classes/03class/exercises/c03-docker02/zarajoy/Dockerfile.v1 .
Sending build context to Docker daemon  58.72MB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY classes/03class/docker/artifacts/c03-docker02/index.html /usr/local/apache2/htdocs/
 ---> afa39ca8a43d
Successfully built afa39ca8a43d
Successfully tagged exercise02:v1
z@bacon:~/Documents/GitHub/academy$ docker run -d -p 8081:80 exercise02:v1
e68856e86acea77e8da081ebfef77db73c8652a29ae0e160ff2a8139c4bcdefc
z@bacon:~/Documents/GitHub/academy$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>


z@bacon:~/Documents/GitHub/academy$ docker build -t exercise02:v2 -f classes/03class/exercises/c03-docker02/zarajoy/Dockerfile.v2 .
Sending build context to Docker daemon  58.72MB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : RUN rm -rf /usr/local/apache2/htdocs/*
 ---> Running in ca24531db7e5
Removing intermediate container ca24531db7e5
 ---> a7a98839daaa
Successfully built a7a98839daaa
Successfully tagged exercise02:v2
z@bacon:~/Documents/GitHub/academy$  docker run --mount type=bind,source=/home/z/Documents/GitHub/academy/classes/03class/docker/artifacts/c03-docker02/,target=/usr/local/apache2/htdocs/ -d -p 8082:80 exercise02:v2
36d136c12ce627863bca69c5640b664831935ee172488f7290c1fd04c2e98cea

```

- Curl command and its output of after changing the image:
```

z@bacon:~/Documents/GitHub/academy$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
z@bacon:~/Documents/GitHub/academy$ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

#change the content of the file classes/03class/docker/artifacts/c03-docker02/index.html

z@bacon:~/Documents/GitHub/academy$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
z@bacon:~/Documents/GitHub/academy$ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02 changed by zara</h1>


```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
v1 is started with the index.html. it is static.
v2 removes the index.html and is bound to the original which we mounted upon build so it reloads with the changes.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)