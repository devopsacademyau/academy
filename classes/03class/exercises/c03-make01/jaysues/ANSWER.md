# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
➜  jaysues git:(jaysues/c03-make01) ✗ make build
Building the Docker image.
echo "This image has been created by jaysues, based on the following SHA: 5d23e6b" > index.html
docker build -t make01:5d23e6b .
[+] Building 3.6s (8/8) FINISHED                                                                                                  
 => [internal] load build definition from Dockerfile                                                                         0.0s
 => => transferring dockerfile: 103B                                                                                         0.0s
 => [internal] load .dockerignore                                                                                            0.0s
 => => transferring context: 2B                                                                                              0.0s
 => [internal] load metadata for docker.io/library/httpd:alpine                                                              3.5s
 => [auth] library/httpd:pull token for registry-1.docker.io                                                                 0.0s
 => [internal] load build context                                                                                            0.0s
 => => transferring context: 113B                                                                                            0.0s
 => CACHED [1/2] FROM docker.io/library/httpd:alpine@sha256:c7b8040505e2e63eafc82d37148b687ff488bf6d25fc24c8bf01d71f5b45753  0.0s
 => [2/2] COPY index.html /usr/local/apache2/htdocs/                                                                         0.0s
 => exporting to image                                                                                                       0.0s
 => => exporting layers                                                                                                      0.0s
 => => writing image sha256:36e05c7da5aa1206c7019d8b6df309bacce6932ffa6b4e44d4f9fa65e33a1de4                                 0.0s
 => => naming to docker.io/library/make01:5d23e6b                                                                            0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

- Execution and output of the command `make push`
```
➜  jaysues git:(jaysues/c03-make01) ✗ make push
Tagging and pushing the image to DockerHub.
docker tag make01:5d23e6b jaysuesdocker/make01:5d23e6b
docker push jaysuesdocker/make01:5d23e6b
The push refers to repository [docker.io/jaysuesdocker/make01]
d2fb2f92f0e2: Pushed 
2e13702b9d23: Layer already exists 
e3bc8d878156: Layer already exists 
e5b0130c309b: Layer already exists 
0675c21f3de0: Layer already exists 
feaedf174d59: Layer already exists 
07d3c46c9599: Layer already exists 
5d23e6b: digest: sha256:24d4c31fcde4b6c44980e2497b1399fc11125195d30632cc2e52994742b61cb7 size: 1779
➜  jaysues git:(jaysues/c03-make01) ✗ 
```

- Execution and output of the command `make run`
```
➜  jaysues git:(jaysues/c03-make01) ✗ make run 
Run the container on Port 80
docker run -d -p 80:80 jaysuesdocker/make01:5d23e6b
17b732ad12872cb3bb58d52b0109d770f89b1e4666225960e804dc5d24c677e5
to test the container is running: 
curl http://localhost:80
This image has been created by jaysues, based on the following SHA: 5d23e6b
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)