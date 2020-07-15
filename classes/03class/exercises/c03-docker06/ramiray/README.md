
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
$ docker build -t hello-name:v1 .
Sending build context to Docker daemon   2.56kB
Step 1/3 : FROM alpine:3.12.0 AS base
 ---> a24bb4013296
Step 2/3 : FROM base as src1
 ---> a24bb4013296
Step 3/3 : ENTRYPOINT ["echo", "Hello"]
 ---> Using cache
 ---> 72cbbf793408
Successfully built 72cbbf793408
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
$ docker run hello-name:v1  rr   
Hello rr
$ docker run hello-name:v1       
Hello

$ docker image ls
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
<none>               <none>              b19a217ba896        5 minutes ago       5.57MB
hello-name           v1                  72cbbf793408        40 minutes ago      5.57MB
alpine               3.12.0              a24bb4013296        6 weeks ago         5.57MB


```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)