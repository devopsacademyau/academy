# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
>make build
@@@ Start Docker Build  for 0257758 @@@
docker build -t "make01:0257758" -f Dockerfile .
Sending build context to Docker daemon  6.144kB
Step 1/3 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
 ---> d76e4371bdba
Step 3/3 : EXPOSE 80
 ---> Running in 78222a926b23
Removing intermediate container 78222a926b23
 ---> f3ddb6136fd6
Successfully built f3ddb6136fd6
Successfully tagged make01:0257758
@@@ Finish Docker Build  for  0257758 @@@
```

- Execution and output of the command `make push`
```
> make push
@@@ Start Docker Push for 0257758 @@@@
docker tag "make01:0257758" raghunadhp/"make01:0257758"
docker push raghunadhp/"make01:0257758"
The push refers to repository [docker.io/raghunadhp/make01]
276bc26d598a: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
0257758: digest: sha256:9b0cd4540e1b251f935c061101e4aeee72d1408afee07ec5abf795cb098ec5e9 size: 1569
@@@ Finish Docker Push for 0257758 @@@
```

- Execution and output of the command `make run`

```
> make run APP_PORT=9087
@@@ Start Docker on  for 9087 @@@
docker run -d -p 9087:80 "make01:0257758" 
93eafdb08469e67d8b7b670b2cf786ea7cf25ae17d6cbe86bd7794931219dd72
@@@ Verify the instance @@@
curl http://localhost:9087
This image was created by Raghunadh Pokkalath, based on the 0257758
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)