## Command Execution Output

- Execution and output of the command `make build`
```
[root@vm make]# make build
echo \<h1\>This image was created by Lucas, based on the ce75f03\<\/h1\> > index.html
docker build -t make01:ce75f03 .
Sending build context to Docker daemon  5.632kB
Step 1/3 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/3 : WORKDIR /usr/local/apache2/htdocs/
 ---> Running in eb0b7e42d50c
Removing intermediate container eb0b7e42d50c
 ---> 3c76b18ea80c
Step 3/3 : COPY index.html .
 ---> c453daca07da
Successfully built c453daca07da
Successfully tagged make01:ce75f03
```

- Execution and output of the command `make push`
```
[root@vm make]# make push
docker tag make01:ce75f03 lgothelipe/make01:ce75f03
docker push lgothelipe/make01:ce75f03
The push refers to repository [docker.io/lgothelipe/make01]
56886663f962: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Mounted from library/httpd
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Mounted from library/httpd
ce75f03: digest: sha256:924915ae5034b23b58e3ed97a3c8e304b9fa2e327551aae577a252171d3fddd3 size: 1569
```

- Execution and output of the command `make run`
```
[root@vm make]# make run
docker run -p :80 make01:ce75f03
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 192.168.1.1. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 192.168.1.1. Set the 'ServerName' directive globally to suppress this message
[Mon Apr 20 12:25:33.497639 2020] [mpm_event:notice] [pid 1:tid 140361220599112] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Mon Apr 20 12:25:33.497663 2020] [core:notice] [pid 1:tid 140361220599112] AH00094: Command line: 'httpd -D FOREGROUND'
```