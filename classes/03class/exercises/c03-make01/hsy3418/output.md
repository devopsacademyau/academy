## build
 ~/Pr/academy/c/05/e/c05-m/hsy3418  on hsy3418/c05-make01 ?1  make build                                                 ok  at 00:14:41 
docker build -t hsy3418/make1 .
Sending build context to Docker daemon   5.12kB
Step 1/3 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
 ---> e60baf2db198
Step 3/3 : EXPOSE 80
 ---> Running in 1ecb261dbd95
Removing intermediate container 1ecb261dbd95
 ---> 36fbdd7e1415
Successfully built 36fbdd7e1415
Successfully tagged hsy3418/make1:latest

## Push
 ~/Pr/academy/c/05/e/c05-m/hsy3418  on hsy3418/c05-make01 ?1  make push                                                  ok  at 00:18:57 
docker push hsy3418/make1
The push refers to repository [docker.io/hsy3418/make1]
6cc46a48ee98: Pushed 
8e24b43b535f: Mounted from hsy3418/exercise02 
1dfb4a5d0ecd: Mounted from hsy3418/exercise02 
3313c0c04ade: Mounted from hsy3418/exercise02 
310889822143: Mounted from hsy3418/exercise02 
beee9f30bc1f: Mounted from hsy3418/exercise02 
latest: digest: sha256:643e38394b3948bb7231ed84272c85a2c940ba9fd299d554e46edafdea5cdadb size: 1569

## Run
PORT=5050 make run                               ok  took 26s  at 00:20:44 
docker run -p 5050:80 hsy3418/make1
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Thu May 07 14:22:48.742757 2020] [mpm_event:notice] [pid 1:tid 139670580272456] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Thu May 07 14:22:48.743761 2020] [core:notice] [pid 1:tid 139670580272456] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [07/May/2020:14:23:04 +0000] "GET / HTTP/1.1" 200 62
172.17.0.1 - - [07/May/2020:14:23:04 +0000] "GET /favicon.ico HTTP/1.1" 404 196