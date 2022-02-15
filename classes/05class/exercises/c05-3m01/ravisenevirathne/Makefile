COMPOSE_RUN = docker-compose run 3muskeeters
export BUCKET_NAME ?= test

create_bucket:
	$(COMPOSE_RUN) make _create_bucket
_create_bucket:
	bash scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN) make _delete_bucket
_delete_bucket:
	bash scripts/delete_bucket.sh

clean:
	docker-c down --remove-orphans