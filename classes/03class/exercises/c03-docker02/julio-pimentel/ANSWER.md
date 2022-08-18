# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
# 1. Create a Linux EC2 instance and connect to it. 
# 2. Create Dockerfile.v1 file 

touch Dockerfile.v1
nano Dockerfile.v1 

FROM httpd:2.4.41-alpine
ADD https://raw.githubusercontent.com/devopsacademyau/academy/master/classes/03class/docker/artifacts/c03-docker02/index.html /usr/local/apache2/htdocs/
RUN chmod 755 -R /usr/local/apache2/htdocs
EXPOSE 80


# 3. Create Docker image and run v1 container 

$ docker build -t exercise02:v1 -f Dockerfile.v1 .
$ docker run -dit --rm -p 8081:80 exercise02:v1
2fcdc6632098a7ff1c2b9e02b236cebb75b743b19c692460b0e51b61727b1183

$ curl http://localhost:8081/
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

# 4. Create Dockerfile.v2 file 

touch Dockerfile.v2
nano Dockerfile.v2

FROM httpd:2.4.41-alpine
RUN rm -rf /usr/local/apache2/htdocs/
EXPOSE 80

# 5. Create Docker image for v2 container 

$ docker build -t exercise02:v2 -f Dockerfile.v2 .


$ curl http://localhost:8082/
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /</title>
 </head>
 <body>
<h1>Index of /</h1>
<ul></ul>
</body></html>
```

- Curl command and its output of after changing the image:
```
$ docker run -p 8082:80 -v "${PWD}/../../../docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/" exercise02:v2
$ curl http://localhost:8082/

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /</title>
 </head>
 <body>
<h1>Index of /</h1>
<ul></ul>
</body></html>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
When index.html is modified locally it will be shown on image v2. This is because image v1 is built on a copy of the 'index.html' file. However, the image v2 didn't have this file at building time and it is mounted at running time. 
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)