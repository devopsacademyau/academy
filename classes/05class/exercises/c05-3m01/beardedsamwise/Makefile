COMPOSE_RUN_AWSCLI = docker-compose run 3musketeers

create_bucket: 
	$(COMPOSE_RUN_AWSCLI) make _create_bucket
_create_bucket:
	bash scripts/create_bucket.sh

list_bucket: 
	$(COMPOSE_RUN_AWSCLI) make _list_bucket
_list_bucket:
	bash scripts/list_bucket.sh

delete_bucket: 
	$(COMPOSE_RUN_AWSCLI) make _delete_bucket
_delete_bucket:
	bash scripts/delete_bucket.sh

cleanDocker: 
	docker-compose down --remove-orphans
