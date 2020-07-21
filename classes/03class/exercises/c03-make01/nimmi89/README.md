# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
$ make build
CREATING INDEX.HTML WITH SHA TAG 49fcfd7
echo "This image was created by nimmi, based on the short commit sha 49fcfd7 " > index.html
BUILDING THE IMAGE
docker build -t make01:49fcfd7  .
Sending build context to Docker daemon  8.192kB
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
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> 5961a7afa1ea
Successfully built 5961a7afa1ea
Successfully tagged make01:49fcfd7

```

- Execution and output of the command `make push`
```
$ make push
PUBLISHING THE IMAGE TO DOCKER HUB
docker tag make01:49fcfd7  netizen89/make01:49fcfd7
docker push netizen89/make01:49fcfd7
The push refers to repository [docker.io/netizen89/make01]
fb58a5e37273: Pushed
8e24b43b535f: Mounted from netizen89/exercise02
1dfb4a5d0ecd: Mounted from netizen89/exercise02
3313c0c04ade: Mounted from netizen89/exercise02
310889822143: Mounted from netizen89/exercise02
beee9f30bc1f: Mounted from netizen89/exercise02
49fcfd7: digest: sha256:8b6f21909044d80409a5e9c57df40af6dffeb54df560956eb00bc91d39f87ca5 size: 1569

```

- Execution and output of the command `make run`
```
$ make run PORT=9000
RUNNING THE CONTAINER ON GIVEN PORT
docker run -d -p 9000:80 make01:49fcfd7
5e67e868dd3491eb332e9c2527f22da65a4e6ee070db01b25f4b55c6a7eaaf5f
CHECKING IF WEB SERVER IS RUNNING on 9000
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    72  100    72    0     0  14400      0 --:--:-- --:--:-- --:--:-- 14400
This image was created by nimmi, based on the short commit sha 49fcfd7

```


***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
