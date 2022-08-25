export BUCKET_NAME ?= your-bucket-name-here

COMPOSE_RUN_AWS = docker-compose run --rm aws-ec2

create_bucket:
	${COMPOSE_RUN_AWS} make _create_bucket

_create_bucket:
	bash scripts/create_bucket.sh

delete_bucket:
	${COMPOSE_RUN_AWS} make _delete_bucket

_delete_bucket:
	bash scripts/delete_bucket.sh