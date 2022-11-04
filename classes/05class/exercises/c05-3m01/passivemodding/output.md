# make create_bucket

The create_bucket command runs the docker compose command which runs the aws container. This container has the main directory mounted and set as the working directory. Calling `make _create_bucket` runs the hash script which creates a bucket using the `BUCKET_NAME` environment variable which was set using the .env file specified in the docker-compose.yml file

I've skipped the initial pull and build of the docker image as subsequent calls don't print this and instead just use the cache
```sh
make create_bucket
docker-compose run --rm aws make _create_bucket
Creating passivemodding_aws_run ... done
bash scripts/create_bucket.sh
***Creating S3 Bucket***
```

# make delete bucket

Similarly, this runs a new container pointed to the cwd which was mounted. It then calls `make _delete_bucket` which runs the bash script that then deletes the bucket with the name specified with the `BUCKET_NAME` environment variable.

```sh
make delete_bucket
docker-compose run --rm aws bash scripts/delete_bucket.sh
Creating passivemodding_aws_run ... done
***Removing S3 Bucket***
remove_bucket: lj-test-2022-08-18
```