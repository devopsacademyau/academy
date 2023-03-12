# Makefile
COMPOSE_RUN = docker-compose run --rm 3m

create_bucket:
	$(COMPOSE_RUN) make _create_bucket

_create_bucket:
	bash scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN) make _delete_bucket

_delete_bucket:
	bash scripts/delete_bucket.sh

_clean: 
	rm -rf ./output

cleanDocker:
	docker-compose down --remove-orphans