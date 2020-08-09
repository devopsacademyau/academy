# Makefile
BUCKET_NAME ?= test
COMPOSE_RUN_EXERCISE = docker-compose run --rm c05-3m01

create_bucket: 
	BUCKET_NAME=$(BUCKET_NAME) $(COMPOSE_RUN_EXERCISE) make _test_create_bucket


delete_bucket: 
	BUCKET_NAME=$(BUCKET_NAME) $(COMPOSE_RUN_EXERCISE) make _test_delete_bucket

target: .env
	$(COMPOSE_RUN_EXERCISE) cat .env

_test_create_bucket:
	bash scripts/create_bucket.sh

_test_delete_bucket:
	bash scripts/delete_bucket.sh

# clean removes the .env
clean: .env
	$(COMPOSE_RUN_EXERCISE) rm .env

cleanDocker:
	docker-compose down --remove-orphans