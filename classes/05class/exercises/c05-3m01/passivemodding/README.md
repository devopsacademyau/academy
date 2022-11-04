# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [docker-compose.yml](docker-compose.yml)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [env.template](env.template)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output

```sh
$ make create_bucket
docker-compose run --rm aws make _create_bucket
Creating passivemodding_aws_run ... done
bash scripts/create_bucket.sh
***Creating S3 Bucket***
make_bucket: lj-test-2022-08-18

$ make delete_bucket
docker-compose run --rm aws bash scripts/delete_bucket.sh
Creating passivemodding_aws_run ... done
***Removing S3 Bucket***
remove_bucket: lj-test-2022-08-18
```

***
Answer for exercise [c05-3m01](https://github.com/devopsacademyau/academy/blob/709a22019c411d4ad7fbda367e35d9ad05ea3505/classes/05class/exercises/c05-3m01/README.md)