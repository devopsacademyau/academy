# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
$ docker build -t hello-name:v1 .
Sending build context to Docker daemon  3.072kB
Step 1/2 : FROM alpine:3.12.0
3.12.0: Pulling from library/alpine
df20fa9351a1: Pull complete
Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Status: Downloaded newer image for alpine:3.12.0
 ---> a24bb4013296
Step 2/2 : CMD echo "Hello ${NAME}"
 ---> Running in 0ba16e441add
Removing intermediate container 0ba16e441add
 ---> 8aba9eaa09bb
Successfully built 8aba9eaa09bb
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
$ docker run -e NAME=Marcos hello-name:v1
Hello Marcos
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)
