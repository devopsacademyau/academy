# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output

```

Comand to Build first Docker image tagges as "exercise02:v1"

    docker build -t exercise02:v1 -f Dockerfile.v1 .

CLI Output
    [+] Building 3.0s (7/7) FINISHED                                                                                                  
    => [internal] load build definition from Dockerfile.v1                                                                      0.0s
    => => transferring dockerfile: 176B                                                                                         0.0s
    => [internal] load .dockerignore                                                                                            0.0s
    => => transferring context: 2B                                                                                              0.0s
    => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                                       2.8s
    => [internal] load build context                                                                                            0.0s
    => => transferring context: 94B                                                                                             0.0s
    => CACHED [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e  0.0s
    => [2/2] COPY ./index.html /usr/local/apache2/htdocs                                                                        0.0s
    => exporting to image                                                                                                       0.0s
    => => exporting layers                                                                                                      0.0s
    => => writing image sha256:487a2743d4b13d719f178076f97dea8ab8cb62a88bba7e53c1ab4c0097b281e5                                 0.0s
    => => naming to docker.io/library/exercise02:v1   


Moving on to create second image with tag "exercise02:v2"

    docker build -t exercise02:v2 -f classes/03class/exercises/c03-docker02/mfreitassm/Dockerfile.v2 .

CLI Output
    [+] Building 1.2s (6/6) FINISHED                                                                                                  
 => [internal] load build definition from Dockerfile.v2                                                                      0.0s
 => => transferring dockerfile: 255B                                                                                         0.0s
 => [internal] load .dockerignore                                                                                            0.0s
 => => transferring context: 2B                                                                                              0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                                       1.1s
 => [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68e  0.0s
 => CACHED [2/2] RUN rm /usr/local/apache2/htdocs/*                                                                          0.0s
 => exporting to image                                                                                                       0.0s
 => => exporting layers                                                                                                      0.0s
 => => writing image sha256:3a52233efb06c3804fc466f4327a0e7ae8c56c3b680b15e8029b658cddcf1896                                 0.0s
 => => naming to docker.io/library/exercise02:v2                                                                             0.0s


Docker images can be checked by running command 
    Docker images

REPOSITORY     TAG              IMAGE ID       CREATED          SIZE
exercise02     v1               487a2743d4b1   5 minutes ago    107MB
<none>         <none>           d6db38ec2a4f   21 minutes ago   107MB
exercise02     v2               3a52233efb06   21 minutes ago   107MB
<none>         <none>           2d3eecff12cb   29 minutes ago   107MB
<none>         <none>           5db162632881   29 minutes ago   107MB
da-terraform   c03-docker-e01   bade9a1b61d2   2 hours ago      88.2MB



Finally to run the docker  container while mapping the port of localhost 8081 to container port 80

    docker run -dp 8081:80 exercise02:v1


Similarly run the docker  container while mapping the port of localhost 8082 to container port 80
    docker run -dp 8082:80 -v ~/desktop/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs exercise02:v2 

```

- Curl command and its output of after changing the image:
```
curl Localhost:8081                                                                                                                         
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl Localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02 test</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
 In the first image "exercise02:v1" there is a copy of the index.html file inside the folder and that's why the webserver's response does not change even though we have made changes to index.html
 Because the changes are made to the original file but webserver is poiniting to the copy of index.html where there are no changes.
 
 In constrast, with the second image has access to host folder using (-v flag). When you use this, a file or directory on the host machine is mounted into a container. Therfore, any changes made on the index.html are visible immediately after a refresh

```
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)