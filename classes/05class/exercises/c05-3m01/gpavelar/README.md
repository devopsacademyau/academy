# C05-3M01

## Make
- [Dockerfile](docker/Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](docker/.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

The step below was performed after build image.

```bash
## Call make file using target create_bucket
gpavelar/c05-3m01  make create_bucket

## Load docker using docker-compose and perform the make _create_bucket inside service aws that was created using given image.
docker-compose -f docker/docker-compose.yml run --rm aws make _create_bucket
## Run the script to create a bucket using environment variable $BUCKET_NAME
bash scripts/create_bucket.sh
## Create bucket using aws-cli command
make_bucket: devops-c05-3m01
```


## `make delete_bucket`

The step below was performed after build image.

```bash
## Call make file using target delete_bucket
gpavelar/c05-3m01  make delete_bucket
## Load docker using docker-compose and perform the make _delete_bucket_ inside service aws that was created using given image.
docker-compose -f docker/docker-compose.yml run --rm aws make _delete_bucket
bash scripts/delete_bucket.sh
## Remove given bucket
remove_bucket: devops-c05-3m01
```

***
Answer for exercise [c05-3m01](<WIP>)