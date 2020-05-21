$ make build 
docker build \
                -t c05-make01:1752d92 \
                --build-arg \
                        index_content="This image was created by Luiz Silva, based on the short commit sha 1752d92" .
Sending build context to Docker daemon   5.12kB
Step 1/4 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/4 : ARG index_content
 ---> Running in fb7023c3c53f
Removing intermediate container fb7023c3c53f
 ---> f04e677995d9
Step 3/4 : RUN echo $index_content > /usr/local/apache2/htdocs/index.html
 ---> Running in 6b24bf391a76
Removing intermediate container 6b24bf391a76
 ---> 57e29bef3a47
Step 4/4 : EXPOSE 80
 ---> Running in cd34786aeaa2
Removing intermediate container cd34786aeaa2
 ---> d45c9d2e8d13
Successfully built d45c9d2e8d13
Successfully tagged c05-make01:1752d92
docker tag c05-make01:1752d92 luizfdsilva/c05-make01:1752d92

$ make push
docker push luizfdsilva/c05-make01:1752d92
The push refers to repository [docker.io/luizfdsilva/c05-make01]
947d151a6424: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
1752d92: digest: sha256:416d561277e2f6894ca7175b3b65ffa960aece532891e47bdeb6baaf0be8d457 size: 1569

$ make run
docker run -p 8080:80 -it c05-make01:1752d92
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Sun May 03 08:14:05.760887 2020] [mpm_event:notice] [pid 1:tid 140571286850888] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Sun May 03 08:14:05.761030 2020] [core:notice] [pid 1:tid 140571286850888] AH00094: Command line: 'httpd -D FOREGROUND'