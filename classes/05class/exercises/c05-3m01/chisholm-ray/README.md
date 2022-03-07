# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make create_bucket
docker-compose run --rm 3m-awscli make _create_bucket
[+] Running 1/0
 ⠿ Network chisholm-ray_default  Created                                                                                                                 0.0s
[+] Building 85.5s (6/6) FINISHED                                                                                                                             
 => [internal] load build definition from Dockerfile                                                                                                     0.0s
 => => transferring dockerfile: 32B                                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                                                                          1.9s
 => [1/2] FROM docker.io/library/ubuntu:18.04@sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad                                    3.3s
 => => resolve docker.io/library/ubuntu:18.04@sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad                                    0.0s
 => => sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad 1.41kB / 1.41kB                                                           0.0s
 => => sha256:98706f0f213dbd440021993a82d2f70451a73698315370ae8615cc468ac06624 529B / 529B                                                               0.0s
 => => sha256:dcf4d4bef137f695d11ed187ba6a135362dca3de36955c4da0905d596ce521bc 1.46kB / 1.46kB                                                           0.0s
 => => sha256:68e7bb398b9ff421236990bfeaf5c1feab26c590eed93489e245375c23551e2a 26.71MB / 26.71MB                                                         2.5s
 => => extracting sha256:68e7bb398b9ff421236990bfeaf5c1feab26c590eed93489e245375c23551e2a                                                                0.7s
 => [2/2] RUN apt-get update && apt-get install curl make unzip sudo python3 -y &&   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -  78.5s
 => exporting to image                                                                                                                                   1.7s
 => => exporting layers                                                                                                                                  1.7s
 => => writing image sha256:c04c10d39d3affd57e083e1b1607744cd48f491965916b66337102474e24d1a0                                                             0.0s 
 => => naming to docker.io/library/chisholm-ray_3m-awscli                                                                                                0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
bash ./scripts/create_bucket.sh
make_bucket: ccr-3m-dojo
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make delete_bucket
docker-compose run --rm 3m-awscli make _delete_bucket
bash ./scripts/delete_bucket.sh
remove_bucket: ccr-3m-dojo
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make cleandocker
make: *** No rule to make target `cleandocker'.  Stop.
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % make cleanDocker
docker-compose down --remove-orphans --rmi all
[+] Running 2/0
 ⠿ Image chisholm-ray_3m-awscli  Removed                                                                                                                 0.0s
 ⠿ Network chisholm-ray_default  Removed                            
```
 
***
Answer for exercise [c05-3m01](<WIP>)
