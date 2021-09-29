# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)
- [output.md](output.md)

## Usage

Configure AWS credentials and the bucket name in `.env` file.

Create Bucket
```
make create_bucket
```

Delete Bucket
```
make delete_bucket
```

## Command Execution Output

```
tomkavanagh tkav (tkav/c05-3m01). >> make create_bucket
docker-compose run --rm aws make _create_bucket
Creating tkav_aws_run ... done
./scripts/create_bucket.sh
make_bucket: tkav-dojo-c05-3m01
tomkavanagh tkav (tkav/c05-3m01). >> make delete_bucket
docker-compose run --rm aws make _delete_bucket
Creating tkav_aws_run ... done
./scripts/delete_bucket.sh
remove_bucket: tkav-dojo-c05-3m01
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c05-3m01](<WIP>)