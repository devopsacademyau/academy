# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

### Instructions
- Export the required variables
```
$ export AWS_ACCESS_KEY=<yourkey>
$ export AWS_SECRET_ACCESS_KEY=<yourkey>
$ export BUCKET_NAME=<your required s3 bucket name>
```
- Build the docker image that contains the AWS CLI tools:
```
$ make build
```
- Create the S3 bucket
```
$ make create_bucket

-- example output
docker-compose run --rm aws bash scripts/create_bucket.sh
make_bucket: obrientimothya-c05-3m01
```
- Delete the S3 bucket
```
$ make delete_bucket

-- example output
docker-compose run --rm aws bash scripts/delete_bucket.sh
remove_bucket: obrientimothya-c05-3m01
```
***
Answer for exercise [c05-3m01](<WIP>)
