# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
$ make build
Getting the short commit sha and saving on index.html
Building container...
docker build --tag frdvo/make01:af435c2 .
Sending build context to Docker daemon  6.656kB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> Using cache
 ---> c0bf412fa4b6
Successfully built c0bf412fa4b6
Successfully tagged frdvo/make01:af435c2
Check below your built container
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
frdvo/make01        af435c2             c0bf412fa4b6        42 minutes ago      107MB
Your container is good to go! make push it!
Made with WSL2🐧💕🐳
```

- Execution and output of the command `make push`
```
$ make push
Pushing the container to Docker Hub
docker push frdvo/make01:af435c2
The push refers to repository [docker.io/frdvo/make01]
eef35c691a5e: Layer already exists
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
af435c2: digest: sha256:1b66aa31e150981422c8ce5c537ae4d7b07fd140248f5ddda7411ed766354db4 size: 1569
Made with WSL2🐧💕🐳
```

- Execution and output of the command `make run`
```
$ p=12345
$ make run
I'm running the long Docker command for you😀💻... You can change the local port through the enviroment variable 'p'
docker run --publish 12345:80 frdvo/make01:6bc6ef0
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)