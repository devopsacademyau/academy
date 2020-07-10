# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```bash
❯ docker build -t hello-name:v1 -f Dockerfile .
Sending build context to Docker daemon  3.584kB
Step 1/3 : FROM alpine:3.12
 ---> a24bb4013296
Step 2/3 : ENTRYPOINT ["echo", "Hello"]
 ---> Running in 5af999900687
Removing intermediate container 5af999900687
 ---> 9a3c8bec7c3a
Step 3/3 : CMD ["John Snow"]
 ---> Running in bd9321c3842e
Removing intermediate container bd9321c3842e
 ---> a93bdf981ef2
Successfully built a93bdf981ef2
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
❯ docker run -it hello-name:v1                                 
Hello John Snow

❯ docker run -it hello-name:v1 Fabio Pereira 
Hello Fabio Pereira
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)