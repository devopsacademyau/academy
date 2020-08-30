RUN_AWS ?= docker-compose run --rm 3m
BUCKET_NAME?=
.PHONY:create_bucket
create_bucket:
	BUCKET_NAME=$(BUCKET_NAME) $(RUN_AWS) make _create_bucket

.PHONY:_create_bucket
_create_bucket:
	bash create_bucket.sh

.PHONY:delete_bucket
delete_bucket:
	BUCKET_NAME=$(BUCKET_NAME) $(RUN_AWS) make _delete_bucket

.PHONY:_delete_bucket
_delete_bucket:
	bash delete_bucket.sh

cleanDocker:
	docker-compose down --remove-orphans

clean: cleanDocker
	rm -f .env