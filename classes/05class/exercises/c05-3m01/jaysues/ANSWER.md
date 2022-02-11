# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
➜  jaysues git:(jaysues/c05-3m01) ✗ make
docker-compose run --rm aws make _create_bucket
[+] Building 111.7s (7/7) FINISHED                                                                                
 => [internal] load build definition from Dockerfile                                                         0.0s
 => => transferring dockerfile: 32B                                                                          0.0s
 => [internal] load .dockerignore                                                                            0.0s
 => => transferring context: 2B                                                                              0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                              3.1s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                0.0s
 => [1/2] FROM docker.io/library/ubuntu:20.04@sha256:669e010b58baf5beb2836b253c1fd5768333f0d1dbcb834f7c07a4  5.4s
 => => resolve docker.io/library/ubuntu:20.04@sha256:669e010b58baf5beb2836b253c1fd5768333f0d1dbcb834f7c07a4  0.0s
 => => sha256:669e010b58baf5beb2836b253c1fd5768333f0d1dbcb834f7c07a4dc93f474be 1.42kB / 1.42kB               0.0s
 => => sha256:7c9c7fed23def3653a0da5bc9ecb651efe155ebd5802c7ba5d585edaa6c89496 529B / 529B                   0.0s
 => => sha256:54c9d81cbb440897908abdcaa98674db83444636c300170cfd211e40a66f704f 1.46kB / 1.46kB               0.0s
 => => sha256:08c01a0ec47e82ebe2bec112f373d160983a6d1e9e66627f66a3322bc403221b 28.56MB / 28.56MB             4.5s
 => => extracting sha256:08c01a0ec47e82ebe2bec112f373d160983a6d1e9e66627f66a3322bc403221b                    0.8s
 => [2/2] RUN apt-get update && apt-get install curl make unzip sudo python3 -y &&   curl "https://awscli  101.4s
 => exporting to image                                                                                       1.7s
 => => exporting layers                                                                                      1.7s
 => => writing image sha256:33e186bcea6026683d68ca28a76e1d97706211a71e64223d3926fc74eafce0c9                 0.0s 
 => => naming to docker.io/library/jaysues_aws                                                               0.0s 
                                                                                                                  
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them              
bash scripts/create_bucket.sh
make_bucket: jaysuesdevopsc053m01

➜  jaysues git:(jaysues/c05-3m01) ✗ make delete_bucket 
docker-compose run --rm aws make _delete_bucket
[+] Running 1/0
 ⠿ Network jaysues_default  Created                                                                          0.0s
[+] Building 1.6s (6/6) FINISHED                                                                                  
 => [internal] load build definition from Dockerfile                                                         0.0s
 => => transferring dockerfile: 32B                                                                          0.0s
 => [internal] load .dockerignore                                                                            0.0s
 => => transferring context: 2B                                                                              0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                              1.5s
 => [1/2] FROM docker.io/library/ubuntu:20.04@sha256:669e010b58baf5beb2836b253c1fd5768333f0d1dbcb834f7c07a4  0.0s
 => CACHED [2/2] RUN apt-get update && apt-get install curl make unzip sudo python3 -y &&   curl "https://a  0.0s
 => exporting to image                                                                                       0.0s
 => => exporting layers                                                                                      0.0s
 => => writing image sha256:33e186bcea6026683d68ca28a76e1d97706211a71e64223d3926fc74eafce0c9                 0.0s
 => => naming to docker.io/library/jaysues_aws                                                               0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
bash scripts/delete_bucket.sh
remove_bucket: jaysuesdevopsc053m01

➜  jaysues git:(jaysues/c05-3m01) ✗ make cleanDocker 
docker-compose down -v --rmi all --remove-orphans
[+] Running 2/0
 ⠿ Image jaysues_aws        Removed                                                                          0.0s
 ⠿ Network jaysues_default  Removed                                                                          0.1s
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c05-3m01](<WIP>)