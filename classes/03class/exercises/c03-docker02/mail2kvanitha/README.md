# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:

```
 DOCKERFILE.v1

 > docker build -t exercise02:v1 -f Dockerfile.v1 .
 Sending build context to Docker daemon  13.82kB
 Step 1/3 : FROM httpd:2.4.41-alpine
  ---> 54b0995a6305
 Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
  ---> e6824bf7cb19
 Step 3/3 : EXPOSE 80
  ---> Running in fb25be9fa7d4
 Removing intermediate container fb25be9fa7d4
  ---> bda9d1507076
 Successfully built bda9d1507076
 Successfully tagged exercise02:v1

 > docker run -d -p 8081:80 exercise02:v1
   2776f5b8dfc295f3a0c19490e50f91e10ca21260c5ec715b94d34224d9ccda7d

 > curl http://localhost:8081
   <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

 DOCKERFILE.V2

 > docker build -t exercise02:v2 -f Dockerfile.v2 .
 Sending build context to Docker daemon  14.85kB
 Step 1/3 : FROM httpd:2.4.41-alpine
  ---> 54b0995a6305
 Step 2/3 : RUN rm -f /usr/local/apache2/htdocs/*
  ---> Running in 3ad8fb195191
 Removing intermediate container 3ad8fb195191
  ---> 98395b1fe971
 Step 3/3 : EXPOSE 80
  ---> Running in 2cb172d8e774
 Removing intermediate container 2cb172d8e774
  ---> e0694673648f
 Successfully built e0694673648f
 Successfully tagged exercise02:v2

 > docker run -d -p 8082:80 -v ~/Downloads/DevopsAcademy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs exercise02:v2
   a1c08b6e0cdccadef2718ef3fd4c5cff1c3b21ebfa05cc9ccf180a7f6fb0246e
 
 > curl http://localhost:8082
   <h1>DevOps Academy - Docker - Exercise c03-docker02</h1> 

```

- Curl command and its output of after changing the image:
```
 Appended below line to classes/03class/docker/artifacts/c03-docker02/index.html
 <h2>This file is modified by Vanitha for c03-docker02 class exercise</h2>

 > curl http://localhost:8081
   <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

 > curl http://localhost:8082
   <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
   <h2>This file is modified by Vanitha for c03-docker02 class exercise</h2> 

```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
 When the exercise02:v1 image was built, the index.html was copied to the folder /usr/local/apache2/htdocs. The container is created using this image built.
 Hence, docker wont reflect the changes in index.html file on the running container with image exercise02:v1.

 On the other hand, the exercise02:v2 image was built with empty /usr/local/apache2/htdocs. But when the container was created from this image, additional parameter is provided to mount 
 the source classes/03class/docker/artifacts/c03-docker02 as target CONTAINER mount point /usr/local/apache2/htdocs. Hence, whatever changes to the files or folders under the source directory will be reflected in the CONTAINER directory. 

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
