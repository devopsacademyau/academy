# since the dockerfile puts us straight into bash, this will 
# essentially give us a single
# bash shell session which will stop the container after exit
COMPOSE_RUN = docker-compose run --rm aws

# run container and execute the script
create_bucket:
	$(COMPOSE_RUN) make _create_bucket

_create_bucket: 
	bash scripts/create_bucket.sh

delete_bucket:
	$(COMPOSE_RUN) bash scripts/delete_bucket.sh

_delete_bucket: 
	bash scripts/delete_bucket.sh

# @ before the line means it will not print the command to console
clean_docker: 
	@echo cleaning
	docker-compose down --remove-orphans

list_docker:
	@echo Listing
	docker ps -a 