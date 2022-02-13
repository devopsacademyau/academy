export BUCKET_NAME ?= test
COMPOSE_RUN = docker-compose run --rm 3m-awscli
ENVFILE ?= 3m.env


create_bucket: 
	${COMPOSE_RUN} make _create_bucket

_create_bucket:
	bash ./scripts/create_bucket.sh

delete_bucket: 
	${COMPOSE_RUN} make _delete_bucket

_delete_bucket:
	bash ./scripts/delete_bucket.sh

cleanDocker:
	docker-compose down --remove-orphans --rmi all