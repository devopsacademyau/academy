# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
➜  jaysues git:(jaysues/c03-docker06) ✗ docker build -t hello_name:v1 .
[+] Building 3.4s (6/6) FINISHED                                                                                                                    
 => [internal] load build definition from Dockerfile                                                                                           0.0s
 => => transferring dockerfile: 88B                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                              0.0s
 => => transferring context: 2B                                                                                                                0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                               3.3s
 => [auth] library/alpine:pull token for registry-1.docker.io                                                                                  0.0s
 => [1/1] FROM docker.io/library/alpine:latest@sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300                         0.0s
 => => resolve docker.io/library/alpine:latest@sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300                         0.0s
 => => sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300 1.64kB / 1.64kB                                                 0.0s
 => => sha256:c74f1b1166784193ea6c8f9440263b9be6cae07dfe35e32a5df7a31358ac2060 528B / 528B                                                     0.0s
 => => sha256:8e1d7573f448dc8d0ca13293b1768959a2528ff04be704f1f3d35fd3dbf6da3d 1.49kB / 1.49kB                                                 0.0s
 => exporting to image                                                                                                                         0.0s
 => => exporting layers                                                                                                                        0.0s
 => => writing image sha256:8ff03a11abe53bcfe686851f79370041942ac4da89c69e96e8138c613d1c5fd5                                                   0.0s
 => => naming to docker.io/library/hello_name:v1                                                                                               0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

- Commands used to execute the image and the output of container execution:
```
➜  jaysues git:(jaysues/c03-docker06) ✗ docker run hello_name:v1 jaysues
Hello jaysues
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)