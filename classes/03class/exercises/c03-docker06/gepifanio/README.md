# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t hello-name:v1 classes/03class/exercises/c03-docker06/gepifanio

Sending build context to Docker daemon  4.096kB
Step 1/3 : FROM alpine:3.12.0
 ---> a24bb4013296
Step 2/3 : ENV NAME=Guilherme
 ---> Running in 14202835f831
Removing intermediate container 14202835f831
 ---> 592bb07e88e0
Step 3/3 : ENTRYPOINT echo "Hello ${NAME}"
 ---> Running in ee97dcb61e72
Removing intermediate container ee97dcb61e72
 ---> 76d8a25008f8
Successfully built 76d8a25008f8
Successfully tagged hello-name:v1

```

- Commands used to execute the image and the output of container execution:
```

docker run -it hello-name:v1

Hello Guilherme

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)