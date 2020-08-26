# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
> docker build -t hello-name:v1 .

---> a24bb4013296
Step 2/2 : ENTRYPOINT [ "echo","hello"]
 ---> Running in e8bdec095b0c
Removing intermediate container e8bdec095b0c
 ---> 21cbdd8f81d0
Successfully built 21cbdd8f81d0
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
> docker run hello-name:v1 raghu
hello raghu
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)