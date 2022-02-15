export BUCKET_NAME ?= test
DOCKER_COMPOSE ?= docker-compose run --rm cli-container

create_bucket:
	$(DOCKER_COMPOSE) make _create_bucket

_create_bucket:
	bash scripts/create_bucket.sh

delete_bucket:
	$(DOCKER_COMPOSE) make _delete_bucket

_delete_bucket:
	bash scripts/delete_bucket.sh

clean_slate:
	docker-compose down --remove-orphans --rmi all
