# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make build
[+] Building 6.2s (8/8) FINISHED                                                                                                                                                                             
 => [internal] load build definition from Dockerfile                                                                                                                                                    0.0s
 => => transferring dockerfile: 121B                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.51-alpine                                                                                                                                  3.9s
 => [auth] library/httpd:pull token for registry-1.docker.io                                                                                                                                            0.0s
 => [internal] load build context                                                                                                                                                                       0.0s
 => => transferring context: 91B                                                                                                                                                                        0.0s
 => [1/2] FROM docker.io/library/httpd:2.4.51-alpine@sha256:c5f6e7bbe1576597694da12d4dd1a244a249f9b5f91c1891b349c812543a63bc                                                                            2.2s
 => => resolve docker.io/library/httpd:2.4.51-alpine@sha256:c5f6e7bbe1576597694da12d4dd1a244a249f9b5f91c1891b349c812543a63bc                                                                            0.0s
 => => sha256:f4362e7f363f62c8d289ed726cbbd8137232e072514bc7c0e56986b90df1db9b 1.57kB / 1.57kB                                                                                                          0.0s
 => => sha256:8f73371c97e3ea179a9e3cd1af130056a5d76592e232e40273a87b34bd7199aa 292B / 292B                                                                                                              0.9s
 => => sha256:c5f6e7bbe1576597694da12d4dd1a244a249f9b5f91c1891b349c812543a63bc 1.65kB / 1.65kB                                                                                                          0.0s
 => => sha256:7c5b35b0fcc102a97d466b8f7705771ea08975ad38305995622b2ed43a35a57b 8.75kB / 8.75kB                                                                                                          0.0s
 => => sha256:dc68ce6a677f07520062d06867e7b8911f9d7d98c64ed0efde9ca3cafa72e7b4 4.25MB / 4.25MB                                                                                                          1.8s
 => => extracting sha256:dc68ce6a677f07520062d06867e7b8911f9d7d98c64ed0efde9ca3cafa72e7b4                                                                                                               0.2s
 => => extracting sha256:8f73371c97e3ea179a9e3cd1af130056a5d76592e232e40273a87b34bd7199aa                                                                                                               0.0s
 => [2/2] ADD ./index.html /usr/local/apache2/htdocs/                                                                                                                                                   0.0s
 => exporting to image                                                                                                                                                                                  0.0s
 => => exporting layers                                                                                                                                                                                 0.0s
 => => writing image sha256:62967fb466812d27291311aeb743f65bc4aa634daa0f2c9ab138daa440ae34b1                                                                                                            0.0s
 => => naming to docker.io/conorcr/make01:555436e                                                                                                                                                       0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make push 
The push refers to repository [docker.io/conorcr/make01]
621da9118d9c: Pushed 
2c1a9020825d: Mounted from library/httpd 
2764aeb164f2: Mounted from library/httpd 
e5b0130c309b: Mounted from conorcr/exercise02 
0675c21f3de0: Mounted from conorcr/exercise02 
feaedf174d59: Mounted from conorcr/exercise02 
07d3c46c9599: Mounted from conorcr/exercise02 
555436e: digest: sha256:d3b5463e340de4252b9e43659dd909592975434214629a3b6fb810f1570ad449 size: 1779
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % docker image ls
REPOSITORY           TAG              IMAGE ID       CREATED          SIZE
conorcr/make01       555436e          62967fb46681   41 seconds ago   54MB
conorcr/exercise02   v2               6f6e8f012fe1   19 hours ago     57MB
conorcr/exercise02   v1               8bada15d8d8d   19 hours ago     57MB
<none>               <none>           37764f9fad4e   20 hours ago     55.8MB
<none>               <none>           7bf411e919ae   20 hours ago     55.8MB
<none>               <none>           59fb75ca2555   20 hours ago     55.8MB
da-terraform         c03-docker-e01   39aa55e96f68   21 hours ago     55.8MB
hello-name           v1               2f3aeeb13c8f   2 months ago     5.33MB

```

- Commands used to execute the image and the output of container execution:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make run HOSTPORT=8081
fcc6f526e251dc9ad72b2396a077aaab80b8f0ba84b8c1ba247b8e047496d451
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % curl localhost:8081
This image was created by Conor, based on the 555436e
```


***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)