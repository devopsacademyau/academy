# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Commands

```

docker build -t exercise02:v1 -f classes/03class/exercises/c03-docker02/gepifanio/Dockerfile.v1 .

Sending build context to Docker daemon  57.38MB
Step 1/2 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY classes/03class/docker/artifacts/c03-docker02/index.html /usr/local/apache2/htdocs/
 ---> ae3f673ae115
Successfully built ae3f673ae115
Successfully tagged exercise02:v1

docker build -t exercise02:v2 -f classes/03class/exercises/c03-docker02/gepifanio/Dockerfile.v2 .

Sending build context to Docker daemon  57.43MB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : RUN rm -rf /usr/local/apache2/htdocs/
 ---> Running in fabeaa83f53d
Removing intermediate container fabeaa83f53d
 ---> e0256558b30d
Successfully built e0256558b30d
Successfully tagged exercise02:v2


```

## Command Execution Output
- Curl command and its output of before changing the image:
```

docker run -p 127.0.0.1:8081:80 exercise02:v1

AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Sun Jul 12 09:52:41.241790 2020] [mpm_event:notice] [pid 1:tid 139666455776584] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Sun Jul 12 09:52:41.241880 2020] [core:notice] [pid 1:tid 139666455776584] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [12/Jul/2020:09:53:27 +0000] "GET / HTTP/1.1" 200 57
172.17.0.1 - - [12/Jul/2020:09:53:27 +0000] "GET /favicon.ico HTTP/1.1" 404 196

curl http://localhost:8081/
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

```

- Curl command and its output of after changing the image:
```
docker run -p 127.0.0.1:8082:80 -v /Users/goliveiraepi/Projects/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -i -t exercise02:v2

curl http://localhost:8082/

curl http://localhost:8082/
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>


```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
I have changed the `index.html` file and the second container the 8082 had the new content changed in the container server.

So the first container `v1` created a copy of the `index.html` file in the server, which is only there and if I need to update anything need to access the container machine and update in there.

The second container `v2` has a reference to the local folder, and anything changed in the local folder automatically update the server. Its awesome!

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)