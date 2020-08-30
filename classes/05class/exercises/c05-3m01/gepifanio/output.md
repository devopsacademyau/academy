# Make create_bucket

➜  gepifanio git:(gepifanio/c05-3m01) ✗ make create_bucket 
docker-compose run --rm aws sh ./scripts/create_bucket.sh
make_bucket: c05-3m01

- It runs the command `COMPOSE_RUN_AWS` which is a variable for `docker-compose run --rm aws` together with `sh ./scripts/create_bucket.sh`

- the file `docker-compose.yaml` will be triggered and it will run the `Dockerfile` as well
- and using the docker created it will run the `sh script` that will create the bucket.

➜  gepifanio git:(gepifanio/c05-3m01) ✗ make delete_bucket
docker-compose run --rm aws sh ./scripts/delete_bucket.sh
remove_bucket: c05-3m01

- this command execute the `docker image` again just to delete the bucket created before.
