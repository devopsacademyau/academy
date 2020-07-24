# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
make build

Sending build context to Docker daemon  4.608kB
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
 ---> 985bdfaa8008
Successfully built 985bdfaa8008
Successfully tagged make01:32f1936
```

- Execution and output of the command `make push`
```
make push

Publishing the container as carloshz4/make01:32f1936
The push refers to repository [docker.io/carloshz4/make01]
6c6db83ac8ad: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
32f1936: digest: sha256:4e8750b3828b88ab5be2147a4ca02d0bed9b051414b890c098c33a6015975917 size: 1569
```

- Execution and output of the command `make run`
```
PORT=8085 make run
Running the container on port 8085...
ab2cef791d9e7554a459c99a26b8952e44ef18bd3ac873801e12192b18a0628f
```

- Then:
```
curl localhost:8085
<h1>This image was created by Carlos Zambrano, based on the 32f1936</h1>
```


***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
