# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
# 1. Create a Dockerfile 
# 2. Create a Makefile

touch Makefile 

# 3. Login to DockerHub and connect to Git 
git init 
docker login 

# 4. Make build command 
$ make build 
Sending build context to Docker daemon  95.23kB
Step 1/3 : FROM httpd:2.4
2.4: Pulling from library/httpd
1efc276f4ff9: Pull complete 
aed046121ed8: Pull complete 
4340e7be3d7f: Pull complete 
80e368ef21fc: Pull complete 
80cb79a80bbe: Pull complete 
Digest: sha256:343452ec820a5d59eb3ab9aaa6201d193f91c3354f8c4f29705796d9353d4cc6
Status: Downloaded newer image for httpd:2.4
 ---> f2a976f932ec
Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
 ---> 3c23c32bdaee
Step 3/3 : EXPOSE 80
 ---> Running in 1bba37883da1
Removing intermediate container 1bba37883da1
 ---> df5e3df52914
Successfully built df5e3df52914
Successfully tagged juliopimentel/c03-make01:a724255

```

- Execution and output of the command `make push`
```
$ make push 
Push Docker image to juliopimentel DockerHub account
The push refers to repository [docker.io/juliopimentel/c03-make01]
3b24790ecbe4: Pushed 
0c2dead5c030: Layer already exists 
54fa52c69e00: Layer already exists 
28a53545632f: Layer already exists 
eea65516ea3b: Layer already exists 
92a4e8a3140f: Layer already exists 
a724255: digest: sha256:ff04a7635352b06cf74dc63954a6e7fce5693533c325e674397ebbf77f852c77 size: 1573
```

- Execution and output of the command `make run`
```
$ make run 
Run Docker image locally
8fc4d7291e4476bf8fd6fbadf43eb970ef955cecc589db68a4123f5ec20a60b4
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)