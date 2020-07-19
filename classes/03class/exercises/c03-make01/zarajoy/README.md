# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
z@bacon:~/Documents/GitHub/academy/classes/03class/exercises/c03-make01/zarajoy$ make build
Building the docker image
echo "This image was created by zarajoy, based on the 9f6b9d2" > index.html
docker build -t make01:9f6b9d2 .
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
 ---> fa1c73e4c354
Successfully built fa1c73e4c354
Successfully tagged make01:9f6b9d2


```

- Execution and output of the command `make push`
```
z@bacon:~/Documents/GitHub/academy/classes/03class/exercises/c03-make01/zarajoy$ make push
Tag and Push image to dockerhub
docker tag make01:9f6b9d2 zarajoy/make01:9f6b9d2
docker push zarajoy/make01:9f6b9d2
The push refers to repository [docker.io/zarajoy/make01]
43a28b3d56cd: Pushed 
8e24b43b535f: Mounted from zarajoy/devops-academy 
1dfb4a5d0ecd: Mounted from zarajoy/devops-academy 
3313c0c04ade: Mounted from zarajoy/devops-academy 
310889822143: Mounted from zarajoy/devops-academy 
beee9f30bc1f: Mounted from zarajoy/devops-academy 
9f6b9d2: digest: sha256:55a5df917119600760761141ff4b696b2830697245ee77d486b2dadad0d5ca06 size: 1569
```

- Execution and output of the command `make run`
```
z@bacon:~/Documents/GitHub/academy/classes/03class/exercises/c03-make01/zarajoy$ make run
Run the container on Port 8080
docker run -d -p 80:80 zarajoy/make01:9f6b9d2
f4d76688160ba7c2df35e5fbee82e8598752c87a2e2120d576b5978e09f4ec2e
test the container is running
curl http://localhost:80
This image was created by zarajoy, based on the 9f6b9d2

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)