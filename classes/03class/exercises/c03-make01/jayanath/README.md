# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
> make build

    =========================
    Building the docker image
    =========================
    echo "This image was created by Jay, based on the `git rev-parse --short HEAD`." > index.html
    docker build -t make01:`git rev-parse --short HEAD` .
    Sending build context to Docker daemon  6.144kB
    Step 1/3 : FROM httpd:2.4.41-alpine
    ---> 54b0995a6305
    Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
    ---> Using cache
    ---> 73c947310e3a
    Step 3/3 : EXPOSE 80
    ---> Using cache
    ---> eed2999d53a8
    Successfully built eed2999d53a8
    Successfully tagged make01:7764a31

```

- Execution and output of the command `make push`
```
> make push

    ===============================
    Pushing the image to Docker Hub
    ===============================
    docker tag make01:`git rev-parse --short HEAD` jayforweb/make01:`git rev-parse --short HEAD`
    docker push jayforweb/make01:`git rev-parse --short HEAD`
    The push refers to repository [docker.io/jayforweb/make01]
    cc4b50489cca: Pushed
    8e24b43b535f: Mounted from jayforweb/teleport
    1dfb4a5d0ecd: Mounted from jayforweb/teleport
    3313c0c04ade: Mounted from jayforweb/teleport
    310889822143: Mounted from jayforweb/teleport
    beee9f30bc1f: Mounted from jayforweb/teleport
    7764a31: digest: sha256:1ed247cc6846d095b3ef265740ca774d527bae4d24e30095f27d0265630297f8 size: 1569

```

- Execution and output of the command `make run`
```
> make run

    ===============================
    Running container on port 8080
    ===============================
    docker run --rm -p 8080:80 make01:`git rev-parse --short HEAD`
    AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
    AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
    [Tue Jul 14 00:10:19.261105 2020] [mpm_event:notice] [pid 1:tid 139824042376520] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
    [Tue Jul 14 00:10:19.261174 2020] [core:notice] [pid 1:tid 139824042376520] AH00094: Command line: 'httpd -D FOREGROUND'
    172.17.0.1 - - [14/Jul/2020:00:10:48 +0000] "GET / HTTP/1.1" 200 53

> curl http://localhost:8080

    This image was created by Jay, based on the 7764a31.
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)