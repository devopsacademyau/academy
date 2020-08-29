# C03-Docker06

## Docker

- [Dockerfile](Dockerfile)

## Command Execution Output

- Commands used to build the image:

```bash
## Build
docker build -t hello-name:v1 .
# Output
Sending build context to Docker daemon  3.584kB
Step 1/2 : FROM alpine:3.7
3.7: Pulling from library/alpine
5d20c808ce19: Pull complete 
Digest: sha256:8421d9a84432575381bfabd248f1eb56f3aa21d9d7cd2511583c68c9b7511d10
Status: Downloaded newer image for alpine:3.7
 ---> 6d1ef012b567
Step 2/2 : ENTRYPOINT ["printf", "Hello %s \n"]
 ---> Running in 2eabdf2ce373
Removing intermediate container 2eabdf2ce373
 ---> c3c72e15d66b
Successfully built c3c72e15d66b
Successfully tagged hello-name:v1

```

- Commands used to execute the image and the output of container execution:

```bash
## Run image
docker run -it hello-name:v1 Hey
# Output
Hello Hey
```

### Resource

[[1](https://phoenixnap.com/kb/docker-cmd-vs-entrypoint)] CMD vs ENTRYPOINT

---

Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)
