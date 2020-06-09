$make create_bucket                    
docker-compose run --rm musketeers sh ./scripts/create_bucket.sh
make_bucket: 3mbucket1

$make delete_bucket                   
docker-compose run --rm musketeers sh ./scripts/delete_bucket.sh
remove_bucket: 3mbucket1