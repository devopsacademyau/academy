# Command output - make create_bucket
➜  vishaalpal git:(vishaalpal/c05-3m01) ✗ make create_bucket
docker-compose run --rm cli-container make _create_bucket
[+] Running 1/0
 ⠿ Network vishaalpal_default  Created                                                                                                                                                                                                                                         0.0s
[+] Building 92.2s (7/7) FINISHED                                                                                                                                                                                                                                                   
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                           0.0s
 => => transferring dockerfile: 328B                                                                                                                                                                                                                                           0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                              0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                                0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                                                                                                                                                                                                3.7s
 => [auth] library/ubuntu:pull token for registry-1.docker.io                                                                                                                                                                                                                  0.0s
 => [1/2] FROM docker.io/library/ubuntu:18.04@sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad                                                                                                                                                          5.0s
 => => resolve docker.io/library/ubuntu:18.04@sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad                                                                                                                                                          0.0s
 => => sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad 1.41kB / 1.41kB                                                                                                                                                                                 0.0s
 => => sha256:98706f0f213dbd440021993a82d2f70451a73698315370ae8615cc468ac06624 529B / 529B                                                                                                                                                                                     0.0s
 => => sha256:dcf4d4bef137f695d11ed187ba6a135362dca3de36955c4da0905d596ce521bc 1.46kB / 1.46kB                                                                                                                                                                                 0.0s
 => => sha256:68e7bb398b9ff421236990bfeaf5c1feab26c590eed93489e245375c23551e2a 26.71MB / 26.71MB                                                                                                                                                                               4.2s
 => => extracting sha256:68e7bb398b9ff421236990bfeaf5c1feab26c590eed93489e245375c23551e2a                                                                                                                                                                                      0.7s
 => [2/2] RUN apt-get update && apt-get install curl make unzip sudo python3 -y &&   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&   unzip awscliv2.zip &&   sudo ./aws/install &&   rm -rf /var/lib/apt/lists/*                       81.7s
 => exporting to image                                                                                                                                                                                                                                                         1.5s
 => => exporting layers                                                                                                                                                                                                                                                        1.5s
 => => writing image sha256:a8ea8ed127e33f46f68b44832fb2c22792ea90ce7f6dec5c5d1fa09a28220789                                                                                                                                                                                   0.0s 
 => => naming to docker.io/library/vishaalpal_cli-container                                                                                                                                                                                                                    0.0s 
                                                                                                                                                                                                                                                                                    
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them                                                                                                                                                                                
bash scripts/create_bucket.sh
make_bucket: c05-3m01
 
 # Command explanation - make create_bucket
This command builds a docker image based off the Dockerfile. It then creates a docker container referencing the docker-compose.yaml file. 
The local volume is then mounted to the container as well as referencing the environment variables in the container to the ".env" which is also specified in the docker-compose.yaml configuration. After executing the shell script "create_bucket.sh", the docker container is removed as specified by the --rm switch in the Makefile.

# Command output - make delete_bucket
➜  vishaalpal git:(vishaalpal/c05-3m01) ✗ make delete_bucket
docker-compose run --rm cli-container make _delete_bucket
bash scripts/delete_bucket.sh
remove_bucket: c05-3m01
➜  vishaalpal git:(vishaalpal/c05-3m01) ✗ 

# Command explanation - make delete_bucket
This command creates another docker container referencing the docker-compose.yaml file. Similarly, the local volume is mounted to the container as well as the environment variables references to the ".env" file. The shell script "delete_bucket.sh" is then executed which deletes the bucket. Lastly, the docker container is removed as specified by the --rm switch in the Makefile. 
