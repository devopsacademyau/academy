# C03-Docker06

## Docker

- [Dockerfile](Dockerfile)

## Command Execution Output

- Commands used to build the image:

```bash
## Build
docker build -t exercise06:v1
# Output
Sending build context to Docker daemon  4.096kB
Step 1/3 : FROM alpine:latest
 ---> a24bb4013296
Step 2/3 : FROM gpavelar/exercise02:v1
 ---> 73a3b15c384b
Step 3/3 : ENTRYPOINT ["printf", "Hello %s \n"]
 ---> Using cache
 ---> 5a2b8be2c271
Successfully built 5a2b8be2c271
Successfully tagged exercise06:v1

```

- Commands used to execute the image and the output of container execution:

```bash
## Run image
docker run -it exercise06:v1 Hey
# Output
Hello Hey
```

### Resource

[[1](https://phoenixnap.com/kb/docker-cmd-vs-entrypoint)] CMD vs ENTRYPOINT

---

Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)
