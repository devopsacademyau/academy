COMPOSE_RUN_AWS = docker-compose run --rm aws
export BUCKET_NAME ?= c05-3m01

create_bucket:
	$(COMPOSE_RUN_AWS) sh ./scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN_AWS) sh ./scripts/delete_bucket.sh

