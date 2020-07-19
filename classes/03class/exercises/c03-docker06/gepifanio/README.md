# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```

docker build -t hello-name:v1 classes/03class/exercises/c03-docker06/gepifanio

Sending build context to Docker daemon  3.584kB
Step 1/2 : FROM alpine:3.12.0
 ---> a24bb4013296
Step 2/2 : ENTRYPOINT ["echo", "Hello"]
 ---> Running in 900b6d9cd3bf
Removing intermediate container 900b6d9cd3bf
 ---> 2e04d5ca9126
Successfully built 2e04d5ca9126
Successfully tagged hello-name:v1

```

- Commands used to execute the image and the output of container execution:
```

docker run -it hello-name:v1 Guilherme

Hello Guilherme

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)