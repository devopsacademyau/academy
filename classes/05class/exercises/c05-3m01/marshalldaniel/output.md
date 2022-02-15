This is the make command execution, which then prints the steps from the create_bucket action below:
make create_bucket
docker-compose run --rm cli-container make _create_bucket

The docker-compose command output follows, which shows the image build:
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

Below is the command executed within the container, which has the local scripts mounted as a volume:
bash scripts/create_bucket.sh
make_bucket: marshalldaniel-3m-s3-01

Below is the delete_bucket command and the docker compose command to create the container:
make delete_bucket
docker-compose run --rm cli-container make _delete_bucket

Below is the command executed within the container:
bash scripts/delete_bucket.sh
remove_bucket: marshalldaniel-3m-s3-01

