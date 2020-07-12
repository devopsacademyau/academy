# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```bash
❯ make build  
docker build -t make01:c2f2b5e .
Sending build context to Docker daemon  6.144kB
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
 ---> 11b0361823a7
Successfully built 11b0361823a7
Successfully tagged make01:c2f2b5e
```

- Execution and output of the command `make push`
```bash
❯ make push
docker tag make01:c2f2b5e facp/make01:c2f2b5e
docker push facp/make01:c2f2b5e
The push refers to repository [docker.io/facp/make01]
15b465192d47: Pushed 
8e24b43b535f: Mounted from facp/exercise02 
1dfb4a5d0ecd: Mounted from facp/exercise02 
3313c0c04ade: Mounted from facp/exercise02 
310889822143: Mounted from facp/exercise02 
beee9f30bc1f: Mounted from facp/exercise02 
c2f2b5e: digest: sha256:8077bd4bf4ca9a59cb84c308d7206702e355e0b87f102bcaf04e8275b4715517 size: 1569
```

- Execution and output of the command `make run`
```bash
❯ make run 
docker run -dp 8081:80 make01:c2f2b5e
6c3f1f245a6cf89099f2b9bf8fa0aa8f4d8d780d23f90cc6b12a0fd153b91319
curl http://localhost:8081
This image was created by 'Fabio Pereira', based on the 'c2f2b5e'
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)