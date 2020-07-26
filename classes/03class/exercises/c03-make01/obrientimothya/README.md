# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
make build

echo "This image was created by Tim, based on the short commit sha e3b6428" > index.html
docker build -t obrientimothya/make01:e3b6428 .
Sending build context to Docker daemon  5.632kB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/index.html
 ---> Using cache
 ---> d95b56b09e6a
Successfully built d95b56b09e6a
Successfully tagged obrientimothya/make01:e3b6428
```

- Execution and output of the command `make push`
```
make push

docker push obrientimothya/make01:e3b6428
The push refers to repository [docker.io/obrientimothya/make01]
c5e012a877fb: Pushed
8e24b43b535f: Mounted from obrientimothya/exercise02
1dfb4a5d0ecd: Mounted from obrientimothya/exercise02
3313c0c04ade: Mounted from obrientimothya/exercise02
310889822143: Mounted from obrientimothya/exercise02
beee9f30bc1f: Mounted from obrientimothya/exercise02
e3b6428: digest: sha256:0c9a83c75f51b4982953478d3fce8d26e7f2ed7f6dd6d92cb55f0024703ceb44 size: 1569
```

- Execution and output of the command `make run`
```
PORT=8080 make run

docker run -it -p 8080:80/tcp obrientimothya/make01:e3b6428
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Sun Jul 26 12:41:13.708331 2020] [mpm_event:notice] [pid 1:tid 139980607380808] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Sun Jul 26 12:41:13.708431 2020] [core:notice] [pid 1:tid 139980607380808] AH00094: Command line: 'httpd -D FOREGROUND'

curl localhost:8080

This image was created by Tim, based on the short commit sha e3b6428
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
