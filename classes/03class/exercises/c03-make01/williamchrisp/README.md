# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
make build
Building Image
docker build -f ./Dockerfile . -t make01:15d0479
[+] Building 1.1s (7/7) FINISHED                                                                                                                                                                                                                                                   
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                          0.0s
 => => transferring dockerfile: 36B                                                                                                                                                                                                                                           0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                               0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                                                                                                                                                                                        1.0s
 => [internal] load build context                                                                                                                                                                                                                                             0.0s
 => => transferring context: 99B                                                                                                                                                                                                                                              0.0s
 => [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed                                                                                                                                                  0.0s
 => CACHED [2/2] COPY index.html /usr/local/apache2/htdocs/                                                                                                                                                                                                                   0.0s
 => exporting to image                                                                                                                                                                                                                                                        0.0s
 => => exporting layers                                                                                                                                                                                                                                                       0.0s
 => => writing image sha256:a1dcc490e33de0326f50c96c5bf62edb34e74e611853fcfdd1f285236d830ec6                                                                                                                                                                                  0.0s
 => => naming to docker.io/library/make01:15d0479                                                                                                                                                                                                                             0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

- Execution and output of the command `make push`
```
make push 
Pushing Image to dockerhub
docker tag make01:15d0479 confide/make01:15d0479
docker push confide/make01:15d0479
The push refers to repository [docker.io/confide/make01]
3e7d6e02d127: Layer already exists 
da8b1af5d0b7: Layer already exists 
93203cf3884d: Layer already exists 
4d98b137a090: Layer already exists 
e77842cc6cf9: Layer already exists 
294ac687b5fc: Layer already exists 
15d0479: digest: sha256:f184727c501c135c7340ffcb1343446b8d500a60eafe6a1b1dd8231d0fd289d6 size: 1569e
```

- Execution and output of the command `make run`
```
make run  
Running Image
docker run -p 8080:80 make01:15d0479
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Wed Aug 17 05:25:51.590106 2022] [mpm_event:notice] [pid 1:tid 281473126551096] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Wed Aug 17 05:25:51.590238 2022] [core:notice] [pid 1:tid 281473126551096] AH00094: Command line: 'httpd -D FOREGROUND'
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)