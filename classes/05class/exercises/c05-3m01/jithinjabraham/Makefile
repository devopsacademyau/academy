export BUCKET_NAME ?= test
COMPOSE_RUN_AWSCLI = docker-compose run --rm awscli-container

create_bucket: 
	$(COMPOSE_RUN_AWSCLI) make _create_bucket

_create_bucket: 
	bash scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN_AWSCLI) make _delete_bucket

_delete_bucket: 
	bash scripts/delete_bucket.sh

cleanDocker: 
	docker-compose down --remove-orphans
