# Call the Make target `make create_bucket` passing the BUCKET_NAME variable
> BUCKET_NAME=raghunadhpokkalath-makefile make create_bucket

echo @@ Create S3 Bucket raghunadhpokkalath-makefile @@@
@@ Create S3 Bucket raghunadhpokkalath-makefile @@@
docker-compose run --rm aws make _create_bucket
chmod +x scripts/create_bucket.sh;scripts/create_bucket.sh
make_bucket: raghunadhpokkalath-makefile

## Call the Make target `make delete_bucket` passing the BUCKET_NAME
> BUCKET_NAME=raghunadhpokkalath-makefile make delete_bucket
echo @@ Delete S3 Bucket raghunadhpokkalath-makefile @@@
@@ Delete S3 Bucket raghunadhpokkalath-makefile @@@
docker-compose run --rm aws make _delete_bucket
chmod +x scripts/delete_bucket.sh;scripts/delete_bucket.sh
remove_bucket: raghunadhpokkalath-makefile