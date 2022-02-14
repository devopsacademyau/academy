## make create_bucket

The following output shows that we're calling the makefile within the Docker container to create an S3 bucket using the BUCKET_NAME environment variable defined in .env

I've also listed all S3 buckets following the creation of the bucket.

```
$ make create_bucket
docker-compose run 3musketeers make _create_bucket
Creating beardedsamwise_3musketeers_run ... done
bash scripts/create_bucket.sh
creating bucket...
make_bucket: sambiac20220214
listing buckets...
2021-11-25 07:23:30 cf-templates-1b0f17j97pa58-ap-southeast-1
2021-11-20 05:21:07 cf-templates-1b0f17j97pa58-ap-southeast-2
2022-02-14 01:13:09 sambiac20220214
```

## make delete_bucket

> The following output shows that we're calling the makefile within the Docker container to delete an S3 bucket using the BUCKET_NAME environment variable defined in .env

```
$ make delete_bucket
docker-compose run 3musketeers make _delete_bucket
Creating beardedsamwise_3musketeers_run ... done
bash scripts/delete_bucket.sh
deleting bucket...
remove_bucket: sambiac20220214
```