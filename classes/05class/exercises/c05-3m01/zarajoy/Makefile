RUN_AWS ?= docker-compose run --rm aws
BUCKET_NAME?=
.PHONY:create_bucket
create_bucket:
	echo Creating S3 Bucket ${BUCKET_NAME} 
	BUCKET_NAME=$(BUCKET_NAME) $(RUN_AWS) make _create_bucket

.PHONY:_create_bucket
_create_bucket:
	bash scripts/create_bucket.sh

.PHONY:delete_bucket
delete_bucket:
	echo Deleteing S3 Bucket ${BUCKET_NAME} 
	BUCKET_NAME=$(BUCKET_NAME) $(RUN_AWS) make _delete_bucket

.PHONY:_delete_bucket
_delete_bucket:
	bash scripts/delete_bucket.sh
