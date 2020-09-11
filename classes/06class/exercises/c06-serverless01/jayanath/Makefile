COMPOSE_RUN=docker-compose run --rm 3m_run
DB_NAME=DA_Serverless

deploy: _create_param
	$(COMPOSE_RUN) make _deploy

clean:
	$(COMPOSE_RUN) make _clean
	make _delete_param

cleanDocker:
	docker-compose down --remove-orphans

_deploy:
	bash scripts/tf_targets.sh deploy

_clean:
	bash scripts/tf_targets.sh clean

_create_param:
	bash scripts/aws_targets.sh create_param $(DB_NAME)

_delete_param:
	bash scripts/aws_targets.sh delete_param