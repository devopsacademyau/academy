# C03-Docker06

## Docker
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
> docker build -t hello-name:v1 .

    Sending build context to Docker daemon  3.072kB
    Step 1/3 : FROM alpine:latest
    latest: Pulling from library/alpine
    df20fa9351a1: Pull complete
    Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
    Status: Downloaded newer image for alpine:latest
    ---> a24bb4013296
    Step 2/3 : ENTRYPOINT ["echo", "Hello"]
    ---> Running in e90c9fa14603
    Removing intermediate container e90c9fa14603
    ---> abee82e3f0e6
    Step 3/3 : CMD ["World"]
    ---> Running in 3389acc0e195
    Removing intermediate container 3389acc0e195
    ---> b5d55d8a2f33
    Successfully built b5d55d8a2f33
    Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
> docker run hello-name:v1 Jay

    Hello Jay

> docker run hello-name:v1
    Hello World

```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)