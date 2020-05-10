$ make create_bucket
docker-compose run --rm aws make _create_bucket
bash scripts/create_bucket.sh
make_bucket: christina-roperto-c05-3m01

$ make delete_bucket
docker-compose run --rm aws make _delete_bucket
bash scripts/delete_bucket.sh
remove_bucket: christina-roperto-c05-3m01