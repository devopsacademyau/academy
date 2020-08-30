```
#How create_bucket delete_bucket works
# It calls create_bucket that runs on host, that spinup a container with docker-compose
# and calls _create_bucket target that run the create script inside the container.

make create_bucket
BUCKET_NAME=da3mtest docker-compose run --rm 3m make _create_bucket
bash create_bucket.sh
make_bucket: 3mtestda


make delete_bucket
BUCKET_NAME=da3mtest docker-compose run --rm 3m make _delete_bucket
bash delete_bucket.sh
remove_bucket: 3mtestda
```