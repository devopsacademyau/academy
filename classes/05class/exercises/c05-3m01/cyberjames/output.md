# make create_bucket
The output below will call the target `create_bucket` from the `Makefile` which run a container and would execute the shell script from `scripts/create_bucket.sh` that would create an S3 BUCKET_NAME based from the define variable at `.env`.

```bash
$ make create_bucket
docker-compose run --rm aws-ec2 make _create_bucket
Creating cyberjames_aws-ec2_run ... done
bash scripts/create_bucket.sh
make_bucket: c05-3m01-contino-james
```

# make delete_bucket
The output below will call the target `delete_bucket` from the `Makefile` which run a container and would execute the shell script from `scripts/delete_bucket.sh` that would delete the S3 BUCKET_NAME based from the define variable at `.env`.

```bash
$ make delete_bucket
docker-compose run --rm aws-ec2 make _delete_bucket
Creating cyberjames_aws-ec2_run ... done
bash scripts/delete_bucket.sh
remove_bucket: c05-3m01-contino-james
```