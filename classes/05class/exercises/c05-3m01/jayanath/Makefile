export BUCKET_NAME ?= test
COMPOSE_RUN = docker-compose run --rm 3m_run

create_bucket:
	$(COMPOSE_RUN) make _create_bucket

delete_bucket:
	$(COMPOSE_RUN) make _delete_bucket

_create_bucket:
	bash scripts/create_bucket.sh

_delete_bucket:
	bash scripts/delete_bucket.sh

cleanDocker:
	docker-compose down --remove-orphans

clean: cleanDocker
	rm -f .env
