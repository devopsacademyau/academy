# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

- Execution and output of the command `make build`
```
➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ make build

################################
# Building Docker Container... #
################################

> docker build -t mrcsmonteiro/make01:c424165 .

Sending build context to Docker daemon  6.656kB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> Using cache
 ---> 9257087c2a7f
Successfully built 9257087c2a7f
Successfully tagged mrcsmonteiro/make01:c424165
```

- Execution and output of the command `make push`
```
➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ make push

##################################
# Pushing Image to Docker Hub... #
##################################

> docker push mrcsmonteiro/make01:c424165

The push refers to repository [docker.io/mrcsmonteiro/make01]
320dee3a0dd7: Pushed
8e24b43b535f: Mounted from mrcsmonteiro/exercise02
1dfb4a5d0ecd: Mounted from mrcsmonteiro/exercise02
3313c0c04ade: Mounted from mrcsmonteiro/exercise02
310889822143: Mounted from mrcsmonteiro/exercise02
beee9f30bc1f: Mounted from mrcsmonteiro/exercise02
c424165: digest: sha256:88f8831cc67e8f3fd1032466e837ee49d44e7fb82a1ef9854c043512ed0ec212 size: 1569
```

- Execution and output of the command `make run`
```
➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ make run

###############################
# Running Docker Container... #
###############################

> docker run -d -p 80 mrcsmonteiro/make01:c424165

bea934ee8d4fa4f9d5d516e3507d62e6d2702b08599604ce404cc2dfe0359c9b

➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ docker container ls
CONTAINER ID        IMAGE                         COMMAND              CREATED             STATUS              PORTS                   NAMES
bea934ee8d4f        mrcsmonteiro/make01:c424165   "httpd-foreground"   11 seconds ago      Up 8 seconds        0.0.0.0:32781->80/tcp   thirsty_kirch

➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ curl localhost:32781
This image was created by Marcos, based on the c424165.
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-make01/README.md)
