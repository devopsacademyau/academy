[root@vm 3m]# make create_bucket
docker-compose run --rm aws make _create_bucket
bash scripts/create_bucket.sh
make_bucket: devopsc053m01

The command make create_bucket ran a docker compose command to run a docker image from a Dockerfile
On the yaml file the .env was included so the container could use the environment variables from the file.
Also on the yaml file the current folder was mapped to the volume /code inside the container.
Then make called _create_bucket target that runs the aws script to create a bucket inside the container



[root@vm 3m]# make delete_bucket
docker-compose run --rm aws make _delete_bucket
bash scripts/delete_bucket.sh
remove_bucket: devopsc053m01

The command make detele_bucket does pretty much the same as make create_bucket but calls the script delete_bucket.sh instead.
