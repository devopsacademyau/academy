# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build the image:
```
docker build -t hello-name:v1
Sending build context to Docker daemon  4.096kB
Step 1/8 : FROM golang:latest AS go
 ---> a794da9351a3
Step 2/8 : WORKDIR /go/
 ---> Using cache
 ---> 15c6605848c4
Step 3/8 : COPY hello.go .
 ---> Using cache
 ---> 3b115d7ebdce
Step 4/8 : RUN go build hello.go
 ---> Running in b43d9392a933
Removing intermediate container b43d9392a933
 ---> da69e10f40da
Step 5/8 : FROM alpine:latest
 ---> a24bb4013296
Step 6/8 : WORKDIR /root/
 ---> Using cache
 ---> 6486b2591ded
Step 7/8 : COPY --from=go /go/hello .
 ---> 1e2748f91b3c
Step 8/8 : CMD ["./hello"]
 ---> Running in a445b9f88cfe
Removing intermediate container a445b9f88cfe
 ---> 271742d65ec9
Successfully built 271742d65ec9
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
NAME=Tim docker run -e NAME hello-name:v1

Hello Tim
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)
