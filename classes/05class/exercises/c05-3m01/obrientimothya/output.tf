# make create_bucket
Mounts the repository folder inside the AWS docker image (as specified in docker-compose.yml)
Docker variables are passed to the docker container, as per `.env`
Then, runs the `create_bucket.sh` to create a new S3 bucket from inside the container (as per the name specified by local environment variable `BUCKET_NAME`)

## Example Output

```
$ export BUCKET_NAME=obrientimothya-c05-3m01
$ make create_bucket

docker-compose run --rm aws bash scripts/create_bucket.sh
make_bucket: obrientimothya-c05-3m01
```

# make delete_bucket
Mounts the repository folder inside the AWS docker image (as specified in docker-compose.yml)
Docker variables are passed to the docker container, as per `.env`
Then, runs the `delete_bucket.sh` to delete the S3 bucket from inside the container (as per the name specified by local environment variable `BUCKET_NAME`)

## Example Output

```
$ export BUCKET_NAME=obrientimothya-c05-3m01
$ make delete bucket

docker-compose run --rm aws bash scripts/delete_bucket.sh
remove_bucket: obrientimothya-c05-3m01
```

