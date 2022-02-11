# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
vishaalpal git:(vishaalpal/c03-make01) ✗ make build

Building docker image...

echo "This image was created by Vishaal Pal, based on the 41e8b55." > index.html
docker build -t make01:41e8b55 .
[+] Building 1.1s (7/7) FINISHED                                                                                                                                                                                                          
 => [internal] load build definition from Dockerfile                                                                                                                                                                                 0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                                                  0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                    0.0s
 => => transferring context: 2B                                                                                                                                                                                                      0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.51-alpine                                                                                                                                                               1.0s
 => [internal] load build context                                                                                                                                                                                                    0.0s
 => => transferring context: 98B                                                                                                                                                                                                     0.0s
 => [1/2] FROM docker.io/library/httpd:2.4.51-alpine@sha256:c5f6e7bbe1576597694da12d4dd1a244a249f9b5f91c1891b349c812543a63bc                                                                                                         0.0s
 => CACHED [2/2] ADD ./index.html /usr/local/apache2/htdocs/                                                                                                                                                                         0.0s
 => exporting to image                                                                                                                                                                                                               0.0s
 => => exporting layers                                                                                                                                                                                                              0.0s
 => => writing image sha256:1d53aea406d3900bc0073a50d259631541cfc5c611c5465f47bfabdcd779f7da                                                                                                                                         0.0s
 => => naming to docker.io/library/make01:41e8b55                                                                                 
```

- Execution and output of the command `make push`
```
vishaalpal git:(vishaalpal/c03-make01) ✗ make push

Pushing image to your dockerhub account...

docker tag make01:41e8b55 vee94/vishaalpal-docker-images:make01
docker push vee94/vishaalpal-docker-images:make01
The push refers to repository [docker.io/vee94/vishaalpal-docker-images]
325f5d50a750: Layer already exists 
2c1a9020825d: Layer already exists 
2764aeb164f2: Layer already exists 
e5b0130c309b: Layer already exists 
0675c21f3de0: Layer already exists 
feaedf174d59: Layer already exists 
07d3c46c9599: Layer already exists 
make01: digest: sha256:76a3e78ee605f9ebc99aed89ed57118aeacaa2764e8fdfb58dd0a3fe6f7bfa70 size: 1779
```

- Execution and output of the command `make run`
```
vishaalpal git:(vishaalpal/c03-make01) ✗ make run

Launching container: c03-make01. Access this container at http://localhost:8081

docker run -d --name c03-make01 -p 8081:80 make01:41e8b55
13db0e156fff73ecb8d38141dd7d76eb122f0871feac491434f47fda3a1898e4

Printing curl output from http://localhost:8081 below

curl http://localhost:8081
This image was created by Vishaal Pal, based on the 41e8b55.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)

