# C05-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

- Execution and output of the command `make build`
```
make build
build the image and tag it with the right value
docker build -t c05-make01:ed17049 .
Sending build context to Docker daemon  9.728kB
Step 1/3 : FROM httpd:2.4
 ---> 8326be82abe6
Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
 ---> 5f343b55068e
Step 3/3 : EXPOSE 80
 ---> Running in 07f3664bdb32
Removing intermediate container 07f3664bdb32
 ---> 16a7d6f0cd4c
Successfully built 16a7d6f0cd4c
Successfully tagged c05-make01:ed17049

```

- Execution and output of the command `make push`
```
make push
push the image to your DockerHub account
docker tag c05-make01:ed17049 christinaroperto/devopsacademy-c05-make01:ed17049
docker push christinaroperto/devopsacademy-c05-make01:ed17049
The push refers to repository [docker.io/christinaroperto/devopsacademy-c05-make01]
d6188751c6d7: Pushed
c428f9ce0941: Layer already exists
020f1f146e60: Layer already exists
040c309b01bf: Layer already exists
fd8cb7ba1791: Layer already exists
c3a984abe8a8: Layer already exists
ed17049: digest: sha256:e449eeb931638a3514c90dc85dee56f1e2cb57a1c81f39cb4574aa608d712b4f size: 1574

```

- Execution and output of the command `make run`
```
PORT=1234 make run
This will run the docker image locally
docker run -it --rm -p 1234:80 c05-make01:ed17049
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Thu Apr 23 08:09:38.061972 2020] [mpm_event:notice] [pid 1:tid 140281813300352] AH00489: Apache/2.4.43 (Unix) configured -- resuming normal operations
[Thu Apr 23 08:09:38.065014 2020] [core:notice] [pid 1:tid 140281813300352] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [23/Apr/2020:08:10:17 +0000] "GET / HTTP/1.1" 200 103
172.17.0.1 - - [23/Apr/2020:08:10:17 +0000] "GET /favicon.ico HTTP/1.1" 404 196

```

***
Answer for exercise [c05-make01](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/05class/exercises/c05-make01/README.md)