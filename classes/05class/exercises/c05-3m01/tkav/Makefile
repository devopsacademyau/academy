export BUCKET_NAME ?= test

COMPOSE_RUN_AWS = docker-compose run --rm aws

create_bucket:
	$(COMPOSE_RUN_AWS) make _create_bucket

_create_bucket: 
	./scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN_AWS) make _delete_bucket

_delete_bucket: 
	./scripts/delete_bucket.sh
