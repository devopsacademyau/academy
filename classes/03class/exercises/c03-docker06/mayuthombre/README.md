# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t hello-name:v1 .

Output
[+] Building 2.6s (6/6) FINISHED                                                                                     
 => [internal] load build definition from Dockerfile                                                            0.0s
 => => transferring dockerfile: 234B                                                                            0.0s
 => [internal] load .dockerignore                                                                               0.0s
 => => transferring context: 2B                                                                                 0.0s
 => [internal] load metadata for docker.io/library/alpine:3.16                                                  2.5s
 => [auth] library/alpine:pull token for registry-1.docker.io                                                   0.0s
 => CACHED [1/1] FROM docker.io/library/alpine:3.16@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee85  0.0s
 => exporting to image                                                                                          0.0s
 => => exporting layers                                                                                         0.0s
 => => writing image sha256:3eadc2a513713debde913a30e86185c8573465a16393b515598288f15689832d                    0.0s
 => => naming to docker.io/library/hello-name:v1                                                                0.0s
```

- Commands used to execute the image and the output of container execution:
```
docker run -it hello-name:v1 Mayu

Output
    Hello Mayu
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)