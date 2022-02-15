# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

make create_bucket
docker-compose run --rm cli-container make _create_bucket
[+] Running 1/0
 ⠿ Network 3m_default  Created                                                                                                        0.0s
[+] Building 2.3s (6/6) FINISHED                                                                                                           
 => [internal] load build definition from Dockerfile                                                                                  0.0s
 => => transferring dockerfile: 32B                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                     0.0s
 => => transferring context: 2B                                                                                                       0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                                                       2.2s
 => [1/2] FROM docker.io/library/ubuntu:18.04@sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad                 0.0s
 => CACHED [2/2] RUN apt-get update && apt-get install curl make unzip sudo python3 -y &&   curl "https://awscli.amazonaws.com/awscl  0.0s
 => exporting to image                                                                                                                0.0s
 => => exporting layers                                                                                                               0.0s
 => => writing image sha256:2348ca17535745137b91111457969a7575d1435470e5d3357597657ab7bfbaca                                          0.0s
 => => naming to docker.io/library/3m_cli-container                                                                                   0.0s
bash scripts/create_bucket.sh
make_bucket: marshalldaniel-3m-s3-01
➜  3m make delete_bucket
docker-compose run --rm cli-container make _delete_bucket
bash scripts/delete_bucket.sh
remove_bucket: marshalldaniel-3m-s3-01

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c05-3m01](<WIP>)
