export BUCKET_NAME?= test
COMPOSE_RUN_AWS= docker-compose run --rm aws
.PHONY:create_bucket
create_bucket:
	echo @@ Create S3 Bucket ${BUCKET_NAME} @@@
	$(COMPOSE_RUN_AWS) make _create_bucket

.PHONY:_create_bucket
_create_bucket:
	chmod +x scripts/create_bucket.sh;scripts/create_bucket.sh

.PHONY:delete_bucket
delete_bucket:
	echo @@ Delete S3 Bucket ${BUCKET_NAME} @@@
	$(COMPOSE_RUN_AWS) make _delete_bucket

.PHONY:_delete_bucket
_delete_bucket:
	chmod +x scripts/delete_bucket.sh;scripts/delete_bucket.sh