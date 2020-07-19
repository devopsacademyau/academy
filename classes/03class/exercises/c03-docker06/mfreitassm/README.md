# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t hello-name:v1 .

Sending build context to Docker daemon  3.072kB
Step 1/2 : FROM alpine:3.7
3.7: Pulling from library/alpine
5d20c808ce19: Pull complete 
Digest: sha256:8421d9a84432575381bfabd248f1eb56f3aa21d9d7cd2511583c68c9b7511d10
Status: Downloaded newer image for alpine:3.7
 ---> 6d1ef012b567
Step 2/2 : ENTRYPOINT [ "echo", "Hello" ]
 ---> Running in d8d288034945
Removing intermediate container d8d288034945
 ---> 82e556fc9539
Successfully built 82e556fc9539
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
docker run -it hello-name:v1 Mariana 
Hello Mariana
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)