# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t hello-name:v1 .

Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM alpine:latest
 ---> a24bb4013296
Step 2/2 : CMD echo "Hello $var"
 ---> Running in e729e7ef5cbe
Removing intermediate container e729e7ef5cbe
 ---> 27c02b0a553f
Successfully built 27c02b0a553f
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
docker run --env var=Carlos hello-name:v1
Hello Carlos
```


***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)
