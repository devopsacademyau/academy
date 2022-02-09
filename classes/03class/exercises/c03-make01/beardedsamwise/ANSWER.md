# C03-MAKE01

## Make
- [Dockerfile](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-make01/classes/03class/exercises/c03-make01/beardedsamwise/Dockerfile)
- [Makefile](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-make01/classes/03class/exercises/c03-make01/beardedsamwise/Makefile))

## Command Execution Output

- Execution and output of the command `make build`
```
$ make build
BUILDING DOCKER IMAGE WITH TAG c03-make01:d285ae1
[+] Building 1.3s (7/7) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                       0.0s
 => => transferring dockerfile: 36B                                                                                                                        0.0s
 => [internal] load .dockerignore                                                                                                                          0.0s
 => => transferring context: 2B                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                                                                     1.2s
 => [internal] load build context                                                                                                                          0.0s
 => => transferring context: 92B                                                                                                                           0.0s
 => [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed                               0.0s
 => CACHED [2/2] COPY ./index.html /usr/local/apache2/htdocs/                                                                                              0.0s
 => exporting to image                                                                                                                                     0.0s
 => => exporting layers                                                                                                                                    0.0s
 => => writing image sha256:294fdb03a4bbca6cebbcd26a885a5f748856a5a96813646094d6e5e7d677130e                                                               0.0s
 => => naming to docker.io/library/make01:d285ae1                                                                                                          0.0s
```

- Execution and output of the command `make push`
```
$ make push
PUSHING DOCKER IMAGE TO DOCKER HUB WITH TAG c03-make01:d285ae1
The push refers to repository [docker.io/beardedsamwise/c03-make01]
70f617da6574: Layer already exists
da8b1af5d0b7: Layer already exists
93203cf3884d: Layer already exists
4d98b137a090: Layer already exists
e77842cc6cf9: Layer already exists
294ac687b5fc: Layer already exists
d285ae1: digest: sha256:5d135c8b815649069495cd86ded8d218bb413c144e5115220f3987c8bcc394ad size: 1569
```

- Execution and output of the command `make run`
```
$ PORT=8081 make run
RUNNING DOCKER IMAGE WITH TAG c03-make01:d285ae1 ON PORT 8081
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Wed Feb 09 04:06:17.431133 2022] [mpm_event:notice] [pid 1:tid 281472983187000] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Wed Feb 09 04:06:17.431159 2022] [core:notice] [pid 1:tid 281472983187000] AH00094: Command line: 'httpd -D FOREGROUND'
172.17.0.1 - - [09/Feb/2022:04:06:28 +0000] "GET / HTTP/1.1" 200 8
172.17.0.1 - - [09/Feb/2022:04:06:31 +0000] "GET / HTTP/1.1" 304 -
172.17.0.1 - - [09/Feb/2022:04:07:20 +0000] "-" 408 -
^C[Wed Feb 09 04:07:24.886007 2022] [mpm_event:notice] [pid 1:tid 281472983187000] AH00491: caught SIGTERM, shutting down
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)