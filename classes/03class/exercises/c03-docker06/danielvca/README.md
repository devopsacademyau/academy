# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t hello-name:v1 .

❯ docker build -t hello-name:v1 .  
Sending build context to Docker daemon 2.048kB  
Step 1/3 : ARG REPO=mcr.microsoft.com/dotnet/core/runtime-deps  
Step 2/3 : FROM $REPO:3.1-alpine3.12  
3.1-alpine3.12: Pulling from dotnet/core/runtime-deps  
df20fa9351a1: Already exists  
ac47820464eb: Pull complete  
Digest: sha256:e043ba8d86cbd92d548a1a9c129ab06ad4b56e8c2001be41a7dceaf096d6278d  
Status: Downloaded newer image for mcr.microsoft.com/dotnet/core/runtime-deps:3.1-alpine3.12  
---> dfefe13bf579  
Step 3/3 : ENTRYPOINT [ "echo", "Hello" ]  
---> Running in 1f12e0255c00  
Removing intermediate container 1f12e0255c00  
---> 29d443ec1129  
Successfully built 29d443ec1129  
Successfully tagged hello-name:v1
```

- Commands used to execute the image and the output of container execution:
```
docker run hello-name:v1 Nurse

❯ docker run hello-name:v1 Nurse  
Hello Nurse
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)

