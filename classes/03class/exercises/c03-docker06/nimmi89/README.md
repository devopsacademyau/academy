# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
$ docker build -t hello_name:v1 .
Sending build context to Docker daemon   5.12kB
Step 1/2 : FROM alpine:3.12.0
3.12.0: Pulling from library/alpine
df20fa9351a1: Pull complete
Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Status: Downloaded newer image for alpine:3.12.0
 ---> a24bb4013296
Step 2/2 : ENTRYPOINT ["echo","Hello"]
 ---> Running in 58c4393c2d88
Removing intermediate container 58c4393c2d88
 ---> a619bec9ab10
Successfully built a619bec9ab10
Successfully tagged hello_name:v1

```

- Commands used to execute the image and the output of container execution:
```
$ docker run hello_name:v1  nimmi
Hello nimmi
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)