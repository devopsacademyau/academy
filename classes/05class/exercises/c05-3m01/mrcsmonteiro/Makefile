COMPOSE_RUN = docker-compose run --rm s3
BUCKET_NAME ?=

create_bucket: 
	@read -p "Bucket name: " BUCKET_NAME; \
	export BUCKET_NAME; \
	$(COMPOSE_RUN) make _create_bucket

delete_bucket: 
	@read -p "Bucket name: " BUCKET_NAME; \
	export BUCKET_NAME; \
	$(COMPOSE_RUN) make _delete_bucket

_create_bucket:
	bash scripts/create_bucket.sh
	@echo

_delete_bucket:
	bash scripts/delete_bucket.sh
	@echo

.PHONY: clean
clean:
	docker-compose down --remove-orphans
