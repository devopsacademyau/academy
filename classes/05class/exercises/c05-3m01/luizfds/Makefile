export BUCKET_NAME ?= test

COMPOSE_RUN_AWS = docker-compose run --rm c05_3m01

.PHONY: create_bucket delete_bucket

create_bucket:
	$(COMPOSE_RUN_AWS) make _create_bucket

_create_bucket: 
	bash scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN_AWS) make _delete_bucket

_delete_bucket: 
	bash scripts/delete_bucket.sh