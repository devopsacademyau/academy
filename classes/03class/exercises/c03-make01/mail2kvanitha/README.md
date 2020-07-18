# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```


 > PORT=8081 make build

   SUCCESS - index.html created successfully
   -rw-r--r--  1 vanithak  staff  62 18 Jul 14:16 index.html
   Creating dynamic index.html file
   Building docker image make01:346418e
   Sending build context to Docker daemon  8.704kB
   Step 1/3 : FROM httpd:2.4.41-alpine
   2.4.41-alpine: Pulling from library/httpd
   aad63a933944: Pull complete 
   29ade582b51e: Pull complete 
   7e41ad5b6f9c: Pull complete 
   ebf61b47b4ca: Pull complete 
   9c060bce4eae: Pull complete 
   Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
   Status: Downloaded newer image for httpd:2.4.41-alpine
    ---> 54b0995a6305
   Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
    ---> 4674d08dcbfa
   Step 3/3 : EXPOSE 80
    ---> Running in b5d5bcef14e4
   Removing intermediate container b5d5bcef14e4
    ---> e335486f1c1d
   Successfully built e335486f1c1d
   Successfully tagged make01:346418e
   SUCCESS - Docker image created successfully
   make01              346418e             e335486f1c1d        Less than a second ago   107MB
   SUCCESS - Removed the index.html file

```

- Execution and output of the command `make push`
```

  > PORT=8081 make push
    
    SUCCESS - index.html created successfully
    -rw-r--r--  1 vanithak  staff  62 18 Jul 14:17 index.html
    Creating dynamic index.html file
    Building docker image make01:346418e
    Sending build context to Docker daemon  8.704kB
    Step 1/3 : FROM httpd:2.4.41-alpine
     ---> 54b0995a6305
    Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
     ---> Using cache
     ---> 4674d08dcbfa
    Step 3/3 : EXPOSE 80
     ---> Using cache
     ---> e335486f1c1d
    Successfully built e335486f1c1d
    Successfully tagged make01:346418e
    SUCCESS - Docker image created successfully
    make01              346418e             e335486f1c1d        56 seconds ago      107MB
    Tagging the docker image...
    SUCCESS - Docker image tagged as mail2kvanitha/devopsacademy:make01 
    The push refers to repository [docker.io/mail2kvanitha/devopsacademy]
    84ca128d64e8: Pushed 
    8e24b43b535f: Layer already exists 
    1dfb4a5d0ecd: Layer already exists 
    3313c0c04ade: Layer already exists 
    310889822143: Layer already exists 
    beee9f30bc1f: Layer already exists 
    make01: digest: sha256:4b8ba8621ed18a34762b2e5a79b405c54a13a6a8cb510860eeca806d5dec2b8f size: 1569
    SUCCESS - docker imaged pushed to Docker Hub successfully


```

- Execution and output of the command `make run`
```

  > PORT=8081 make run

    SUCCESS - index.html created successfully
    -rw-r--r--  1 vanithak  staff  62 18 Jul 14:16 index.html
    Creating dynamic index.html file
    Building docker image make01:346418e
    Sending build context to Docker daemon  8.704kB
    Step 1/3 : FROM httpd:2.4.41-alpine
     ---> 54b0995a6305
    Step 2/3 : COPY index.html /usr/local/apache2/htdocs/
     ---> Using cache
     ---> 4674d08dcbfa
    Step 3/3 : EXPOSE 80
     ---> Using cache
     ---> e335486f1c1d
   Successfully built e335486f1c1d
   Successfully tagged make01:346418e
   SUCCESS - Docker image created successfully
   make01              346418e             e335486f1c1d        20 seconds ago      107MB
   Creating Container ...
   e5e02beed9b4c3e61824dd16c87e8fdd9e23ab95a719c73461ef42db0f11ea55
   SUCCESS - Docker Container successfully created and started
   e5e02beed9b4        make01:346418e      "httpd-foreground"   1 second ago        Up Less than a second   0.0.0.0:8081->80/tcp   MAGE_NAME
   INFO - Checking the Webserver
   This image was created by mail2kvanitha, based on the 346418e
 

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
