export BUCKET_NAME ?= test

# Makefile
COMPOSE_RUN_AWS = docker-compose run --rm aws

.PHONY: create_bucket cleanDocker

deploy: create_bucket

create_bucket:
	$(COMPOSE_RUN_AWS) make _create_bucket

_create_bucket: 
	bash scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN_AWS) make _delete_bucket

_delete_bucket: 
	bash scripts/delete_bucket.sh

clean: cleanDocker

cleanDocker:
	docker-compose down -v --rmi all --remove-orphans