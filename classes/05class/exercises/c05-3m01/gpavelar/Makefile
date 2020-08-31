COMPOSE_PATH = docker/docker-compose.yml
COMPOSE_ENV = docker-compose -f ${COMPOSE_PATH}
COMPOSE_RUN = ${COMPOSE_ENV} run --rm
export BUCKET_NAME ?= test

##+MAKEFILE HELPER
##+
##+GENERAL COMMANDS
help: 				##+ Lista os comandos disponíveis.
	@fgrep -h "##+" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##+//'

##+
##+COMPOSE CMD
up:			##+ Builds the compose containers.
	${COMPOSE_ENV} up -d
down:   ##+ Downs the compose containers.
	${COMPOSE_ENV} down
build:			##+ Builds the compose containers.
	${COMPOSE_ENV} build

##+
##+ c05-3m01
##+

create_bucket:
	$(COMPOSE_RUN) aws make _create_bucket
.PHONY: create_bucket

delete_bucket:
	$(COMPOSE_RUN) aws make _delete_bucket
.PHONY: delete_bucket

_create_bucket: ##+ Run create_bucket script.
	bash scripts/create_bucket.sh

_delete_bucket:  ##+ Run delete_bucket script.
	bash scripts/delete_bucket.sh