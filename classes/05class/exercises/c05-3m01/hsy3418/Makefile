COMPOSE_RUN_MUSKETEERS = docker-compose run --rm musketeers
export BUCKET_NAME ?= 3mbucket1

# clean removes the .env
clean: .env
	$(COMPOSE_RUN_ALPINE) rm .env

create_bucket:
	$(COMPOSE_RUN_MUSKETEERS) sh ./scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN_MUSKETEERS) sh ./scripts/delete_bucket.sh

