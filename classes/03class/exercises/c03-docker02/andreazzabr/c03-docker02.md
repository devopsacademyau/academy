c03-docker02


Create two docker images, being: 

# question 1
- Named `exercise02` with a tag `v1` with the following pre-requisites:
    - Dockerfile must be named Dockerfile.v1
    - Final image is based from httpd:2.4.41-alpine
    - Copy the file classes/03class/docker/artifacts/c03-docker02/index.html into the folder /usr/local/apache2/htdocs/


anderson@andreazza:~/academy$ sudo docker build -t exercise02:v1 -f ../dockeroos/dockerfile-c03docker02-v1 .
Sending build context to Docker daemon  43.32MB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> cb171b88ec92
Step 2/2 : COPY /classes/03class/docker/artifacts/c03-docker02/index.html /usr/local/apache2/htdocs
 ---> Using cache
 ---> 481a0f63bb9d
Successfully built 481a0f63bb9d
Successfully tagged exercise02:v1
anderson@andreazza:~/academy$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
exercise02          v1                  481a0f63bb9d        12 seconds ago       109MB
httpd               2.4.41-alpine       cb171b88ec92        7 weeks ago         109MB


anderson@andreazza:~$ sudo docker run -p 8081:80 -it exercise02:v1
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Thu Mar 12 13:33:25.397172 2020] [mpm_event:notice] [pid 1:tid 139661905014088] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Thu Mar 12 13:33:25.397236 2020] [core:notice] [pid 1:tid 139661905014088] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [12/Mar/2020:13:33:42 +0000] "GET / HTTP/1.1" 304 -
172.17.0.1 - - [12/Mar/2020:13:37:13 +0000] "GET / HTTP/1.1" 304 -
^C[Thu Mar 12 13:43:06.972597 2020] [mpm_event:notice] [pid 1:tid 139661905014088] AH00491: caught SIGTERM, shutting down



# question 2
- Named `exercise02` with a tag `v2` with the following pre-requisites
    - Dockerfile must be named Dockerfile.v2
    - Final image is based from httpd:2.4.41-alpine
    - The folder /usr/local/apache2/htdocs/ must be empty


anderson@andreazza:~/academy$ sudo docker build -t exercise02:v2 -f ../dockeroos/dockerfile-c03docker02-v2 .
Sending build context to Docker daemon  43.33MB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> cb171b88ec92
Step 2/2 : RUN rm -rf /usr/local/apache2/htdocs/
 ---> Running in edc1476463a4
Removing intermediate container edc1476463a4
 ---> 468cd0f1c804
Successfully built 468cd0f1c804
Successfully tagged exercise02:v2
anderson@andreazza:~/academy$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
exercise02          v2                  468cd0f1c804        9 seconds ago       109MB
exercise02          v1                  481a0f63bb9d        15 minutes ago      109MB
httpd               2.4.41-alpine       cb171b88ec92        7 weeks ago         109MB


anderson@andreazza:~$ sudo docker run -v /home/anderson/academy/classes/03class/docker/artifacts/c03-docker02/:/usr/local/apache2/htdocs  -p 8082:80 -it exercise02:v2
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
[Thu Mar 12 13:38:37.925908 2020] [mpm_event:notice] [pid 1:tid 140052373351752] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Thu Mar 12 13:38:37.925971 2020] [core:notice] [pid 1:tid 140052373351752] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [12/Mar/2020:13:38:42 +0000] "GET / HTTP/1.1" 200 57
172.17.0.1 - - [12/Mar/2020:13:39:39 +0000] "GET / HTTP/1.1" 200 82
^C[Thu Mar 12 13:42:43.184578 2020] [mpm_event:notice] [pid 1:tid 140052373351752] AH00491: caught SIGTERM, shutting down



## Submit a PR with the following files:
- Dockerfile.v1: used to create the first image
- Dockerfile.v2: used to create the second image
- c03-docker02.txt: Containing the output of the curl commands executed before and after changing the file indicated. Explain any difference between the responses of the webservers before and after changing the file locally. 

anderson@andreazza:~/academy$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
anderson@andreazza:~/academy$ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
anderson@andreazza:~/academy$ 
anderson@andreazza:~/academy$ 
anderson@andreazza:~/academy$ 
anderson@andreazza:~/academy$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
anderson@andreazza:~/academy$ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
<html>cool exercise!!</html>
anderson@andreazza:~/academy$ 


after changing the file locally, the second webserver showed the updated version, while the first webserver still showed the file copied during the container build.
