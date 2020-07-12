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

> docker build -t mrcsmonteiro/make01:5f38c2d .

Sending build context to Docker daemon  8.192kB
Step 1/2 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> 88a1324e89b1
Successfully built 88a1324e89b1
Successfully tagged mrcsmonteiro/make01:5f38c2d
```

- Execution and output of the command `make push`
```
➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ make push

##################################
# Pushing Image to Docker Hub... #
##################################

> docker push mrcsmonteiro/make01:5f38c2d

The push refers to repository [docker.io/mrcsmonteiro/make01]
1c154bff49d0: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
5f38c2d: digest: sha256:984fac30aff5ccae39cf7a888437cc8445788d3583c1782945c08b861b2014b1 size: 1569
```

- Execution and output of the command `make run`
```
➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ make run

###############################
# Running Docker Container... #
###############################

Type the local host port to be mapped: 8080

> docker run -d -p 8080:80 mrcsmonteiro/make01:5f38c2d

0180c3f030d9c43be227b789ecdc8b5945c0566892f99caeee66bda57093d36d

➜  mrcsmonteiro git:(mrcsmonteiro/c03-make01) ✗ curl localhost:8080
This image was created by Marcos, based on the 5f38c2d.
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-make01/README.md)
