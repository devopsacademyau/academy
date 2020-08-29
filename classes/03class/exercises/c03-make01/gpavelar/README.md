# C03-MAKE01

## Make

- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`

```bash
## Command
make build
# Outputmake build
Building Docker Image gpavelar/make01:711ce9e0
Sending build context to Docker daemon   7.68kB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> Using cache
 ---> c2efe9c19546
Successfully built c2efe9c19546
Successfully tagged make01:711ce9e0
```

- Execution and output of the command `make push`

```bash
## Command
make push
# Outputmake push
The push refers to repository [docker.io/gpavelar/make01]
f2fc3456b8e7: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
711ce9e0: digest: sha256:a2c8b920a99295e820224a20fccc19cbd4f14b1307d656e849ac3269d7faf44e size: 1569
```

- Execution and output of the command `make run`

```bash
## command
export PORT=8083
make run
# Output
Running the container on port 8083...
8c0935d670fd86acf30dafb5a6b5f33b6ef17dd7752a102e284f35b96b8c7372
## Curl
(base)  crazynight@crazynight  curl localhost:8083
<b>This image was created by gpavelar, based on the e031811d <b>
```

---

Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
