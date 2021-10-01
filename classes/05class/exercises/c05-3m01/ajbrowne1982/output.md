make create_bucket

docker-compose run --rm aws make _create_bucket
[+] Building 2.5s (6/6) FINISHED
 => [internal] load build definition from Dockerfile                                                  0.0s
 => => transferring dockerfile: 32B                                                                   0.0s
 => [internal] load .dockerignore                                                                     0.0s
 => => transferring context: 2B                                                                       0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                       2.4s
 => [1/2] FROM docker.io/library/ubuntu:18.04@sha256:9bc830af2bef73276515a29aa896eedfa7bdf4bdbc5c106  0.0s
 => CACHED [2/2] RUN apt-get update && apt-get install curl make unzip sudo python3 -y &&   curl "ht  0.0s
 => exporting to image                                                                                0.0s
 => => exporting layers                                                                               0.0s
 => => writing image sha256:56f0ef3d7c354f02bf63be02b5a6f1eb7603e9de27a63fa8d30125abd2139c6f          0.0s
 => => naming to docker.io/library/ajbrowne1982_aws                                                   0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
./scripts/create_bucket.sh
make_bucket: andrew-browne-c05-3m01



make delete_bucket
docker-compose run --rm aws make _delete_bucket
./scripts/delete_bucket.sh
remove_bucket: andrew-browne-c05-3m01
