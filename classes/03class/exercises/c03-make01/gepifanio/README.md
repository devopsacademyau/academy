# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make`

```
make

echo "This image was created by Guilherme based on the 9b9bbe1" > index.html
docker build -t make01:9b9bbe1 .
Sending build context to Docker daemon  6.144kB
Step 1/2 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> 37cf6cbbce68
Successfully built 37cf6cbbce68
Successfully tagged make01:9b9bbe1
docker tag make01:9b9bbe1 guiepifanio/make01:9b9bbe1
docker push guiepifanio/make01:9b9bbe1
The push refers to repository [docker.io/guiepifanio/make01]
f5183ea544cd: Pushed
8e24b43b535f: Mounted from guiepifanio/exercise02
1dfb4a5d0ecd: Mounted from guiepifanio/exercise02
3313c0c04ade: Mounted from guiepifanio/exercise02
310889822143: Mounted from guiepifanio/exercise02
beee9f30bc1f: Mounted from guiepifanio/exercise02
9b9bbe1: digest: sha256:4cb6d87e0bd9c25b397b32646a28a20f8ee260239b539e2be7d425cdc77107f7 size: 1569
docker run -p 80 -d guiepifanio/make01:9b9bbe1
33320a5cc0fcc3ac2558cb7a43f8f45cec1580f45674ad8f7d8d38fddbbb6cbc

make clean_up

docker container prune
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
5d588b09b95d6a03d5df42f66fe6385e3abde715f872a97d8ae3783a8a202838
48723255c8b0be3c0e3b1f2fcf698071975b56a28fc9f63bdd318df292300bdd

Total reclaimed space: 0B
docker image rm make01:9b9bbe1
Untagged: make01:9b9bbe1
docker image rm guiepifanio/make01:9b9bbe1
Error response from daemon: conflict: unable to remove repository reference "guiepifanio/make01:9b9bbe1" (must force) - container 33320a5cc0fc is using its referenced image 37cf6cbbce68
make: *** [clean_up] Error 1

```

- Execution and output of the command `make build`
```

make build
echo "This image was created by Guilherme based on the 9b9bbe1" > index.html
docker build -t make01:9b9bbe1 .
Sending build context to Docker daemon  6.144kB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> Using cache
 ---> 37cf6cbbce68
Successfully built 37cf6cbbce68
Successfully tagged make01:9b9bbe1
docker tag make01:9b9bbe1 guiepifanio/make01:9b9bbe1

```

- Execution and output of the command `make push`
```

make push
docker push guiepifanio/make01:9b9bbe1
The push refers to repository [docker.io/guiepifanio/make01]
f5183ea544cd: Pushed
8e24b43b535f: Mounted from guiepifanio/exercise02
1dfb4a5d0ecd: Mounted from guiepifanio/exercise02
3313c0c04ade: Mounted from guiepifanio/exercise02
310889822143: Mounted from guiepifanio/exercise02
beee9f30bc1f: Mounted from guiepifanio/exercise02
9b9bbe1: digest: sha256:4cb6d87e0bd9c25b397b32646a28a20f8ee260239b539e2be7d425cdc77107f7 size: 1569

```

- Execution and output of the command `make run`
```

make run
docker run -p 80 -d guiepifanio/make01:9b9bbe1
3e034f59092a9a4f88aab7d0fb582de8cf78a6dff5acd201b6a32c51c7d116e1

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)