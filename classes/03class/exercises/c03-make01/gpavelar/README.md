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
Building Docker Image gpavelar/make01:e031811d
Sending build context to Docker daemon  6.656kB
Step 1/7 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/7 : ARG REGISTRY
 ---> Using cache
 ---> 5bc5a4894d64
Step 3/7 : ENV REGISTRY ${REGISTRY}
 ---> Using cache
 ---> d5e627e64388
Step 4/7 : ARG TAG
 ---> Using cache
 ---> 725a06727ff7
Step 5/7 : ENV TAG ${TAG}
 ---> Running in ffb57f561568
Removing intermediate container ffb57f561568
 ---> d276f28106fd
Step 6/7 : RUN rm /usr/local/apache2/htdocs/index.html
 ---> Running in 277e8b054d7a
Removing intermediate container 277e8b054d7a
 ---> bb2eba6571be
Step 7/7 : RUN echo "<b>This image was created by ${REGISTRY}, based on the ${TAG} <b>" > /usr/local/apache2/htdocs/index.html
 ---> Running in c5a3c0bdfc51
Removing intermediate container c5a3c0bdfc51
 ---> d99edb3358dd
Successfully built d99edb3358dd
Successfully tagged make01:e031811d
```

- Execution and output of the command `make push`

```bash
## Command
make push
# Output
Publishing the container as gpavelar/make01:e031811d
The push refers to repository [docker.io/gpavelar/make01]
4edfca6d18ac: Pushed 
0b68f06852f9: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
e031811d: digest: sha256:fe8258fd429cc97cfcc456b4bae086ebed27562210871d3767b70190ef840af9 size: 1776
```

- Execution and output of the command `make run`

```bash
## command
export PORT=8083
make run
# Output
Running the container on port 8083...
4e324704e2c5993fde3f25395f2e6d042f3ffba48debc23ac34ae633aceadae3

## Curl
(base)  crazynight@crazynight  curl localhost:8083
<b>This image was created by gpavelar, based on the e031811d <b>
```

---

Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
