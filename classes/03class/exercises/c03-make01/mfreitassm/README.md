# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
make build
Creating image
Building docker file
docker build -t make01:32f1936  .
Sending build context to Docker daemon   5.12kB
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
 ---> 1e54727391f7
Successfully built 1e54727391f7
Successfully tagged make01:32f1936

```

- Execution and output of the command `make push`
```
Pushing image to dockerhub
docker push mfreitassm/c03-make01:32f1936 
The push refers to repository [docker.io/mfreitassm/c03-make01]
ce3189229fda: Pushed 
8e24b43b535f: Mounted from mfreitassm/devopsacademy 
1dfb4a5d0ecd: Mounted from mfreitassm/devopsacademy 
3313c0c04ade: Mounted from mfreitassm/devopsacademy 
310889822143: Mounted from mfreitassm/devopsacademy 
beee9f30bc1f: Mounted from mfreitassm/devopsacademy 
32f1936: digest: sha256:4b0b4713b0a303769b2d59435825d2c65cacdd5a31b95fcfa8d6db257f63287c size: 1569
```

- Execution and output of the command `make run`
```
Runnig Container
docker run -dp 8083:80 make01:32f1936 
ed8bb7a04999e20d21241e042cb833cb7fd7b9a9a24beb841e3057b899c149d0
curl http://localhost:8083
This image was created by Mariana Freitas , based on the 32f1936 
```
 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)