# C03-MAKE01

## Make
- [Dockerfile](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-make01/classes/03class/exercises/c03-make01/beardedsamwise/Dockerfile)
- [Makefile](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-make01/classes/03class/exercises/c03-make01/beardedsamwise/Makefile))

## Command Execution Output

- Execution and output of the command `make build`
```
$ make build
BUILDING DOCKER IMAGE WITH TAG c03-make01:b02b1d8
[+] Building 1.2s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                       0.0s
 => => transferring dockerfile: 36B                                                                                                                        0.0s
 => [internal] load .dockerignore                                                                                                                          0.0s
 => => transferring context: 2B                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                                                                     1.1s
 => [internal] load build context                                                                                                                          0.0s
 => => transferring context: 144B                                                                                                                          0.0s
 => CACHED [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed                        0.0s
 => [2/2] COPY ./index.html /usr/local/apache2/htdocs/                                                                                                     0.0s
 => exporting to image                                                                                                                                     0.0s
 => => exporting layers                                                                                                                                    0.0s
 => => writing image sha256:15e9098f78961c4a808f629da3b91a76665d5fcdb82e406a58c3e00bffc106eb                                                               0.0s
 => => naming to docker.io/library/make01:b02b1d8                                                                                                          0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

- Execution and output of the command `make push`
```
$ make push
PUSHING DOCKER IMAGE TO DOCKER HUB WITH TAG c03-make01:b02b1d8
The push refers to repository [docker.io/beardedsamwise/c03-make01]
b8b0b16909e5: Pushed
da8b1af5d0b7: Layer already exists
93203cf3884d: Layer already exists
4d98b137a090: Layer already exists
e77842cc6cf9: Layer already exists
294ac687b5fc: Layer already exists
b02b1d8: digest: sha256:a2a91f1703d89c125c4be379f89116b8886372bb691deb3cf02b812c5856f09e size: 1569
```

- Execution and output of the command `make run`
```
$ PORT=8081 make run
RUNNING DOCKER IMAGE WITH TAG c03-make01:b02b1d8 ON PORT 8081
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Wed Feb 09 04:19:17.675836 2022] [mpm_event:notice] [pid 1:tid 281473646042680] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Wed Feb 09 04:19:17.675857 2022] [core:notice] [pid 1:tid 281473646042680] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [09/Feb/2022:04:19:25 +0000] "GET / HTTP/1.1" 200 73
```
- Output of curl to validate web server returns the correct output
```
$ curl localhost:8081
This image was created by Sam Bentley, based on the short commit b02b1d8
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)