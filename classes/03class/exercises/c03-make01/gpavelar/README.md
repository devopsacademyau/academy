# C03-MAKE01

## Make

- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`

```bash
## Command
make build
# Output
Building Docker Image gpavelar/make01:32f1936
Sending build context to Docker daemon   5.12kB
Step 1/7 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/7 : ARG REGISTRY
 ---> Running in c06570b8a1ae
Removing intermediate container c06570b8a1ae
 ---> 5bc5a4894d64
Step 3/7 : ENV REGISTRY ${REGISTRY}
 ---> Running in ed032c609375
Removing intermediate container ed032c609375
 ---> d5e627e64388
Step 4/7 : ARG TAG
 ---> Running in 8cef6dc25b77
Removing intermediate container 8cef6dc25b77
 ---> 725a06727ff7
Step 5/7 : ENV TAG ${TAG}
 ---> Running in 7bcd2c59b4ac
Removing intermediate container 7bcd2c59b4ac
 ---> 10b55b32a5dc
Step 6/7 : RUN rm /usr/local/apache2/htdocs/index.html
 ---> Running in b1ecd65bbe78
Removing intermediate container b1ecd65bbe78
 ---> c943270d18df
Step 7/7 : RUN echo "<b>This image was created by ${REGISTRY}, based on the ${TAG} <b>" > /usr/local/apache2/htdocs/index.html
 ---> Running in 1143ee55ea7a
Removing intermediate container 1143ee55ea7a
 ---> 0db4b6cfb9c9
Successfully built 0db4b6cfb9c9
Successfully tagged make01:32f1936
```

- Execution and output of the command `make push`

```bash
## Command
make push
# Output
Publishing the container as gpavelar/make01:32f1936
The push refers to repository [docker.io/gpavelar/make01]
8d2a7f1c7878: Pushed
fa6cbbbdc159: Pushed
8e24b43b535f: Mounted from gpavelar/exercise02
1dfb4a5d0ecd: Mounted from gpavelar/exercise02
3313c0c04ade: Mounted from gpavelar/exercise02
310889822143: Mounted from gpavelar/exercise02
beee9f30bc1f: Mounted from gpavelar/exercise02
32f1936: digest: sha256:65c0a028364e9f17f628a0acff32c1ee1581d72ef4b6e40095d531ce855f1faa size: 1776
```

- Execution and output of the command `make run`

```bash
## command
make run
# Output
Running the container on port 8081...
cbcf6662fbef09ba1a7189e1e99974a1b7e9664b9ffe964f67749c5fde927e60

## Curl
(base)  crazynight@crazynight  curl localhost:8081
<b>This image was created by gpavelar, based on the 32f1936 <b>
```

---

Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
