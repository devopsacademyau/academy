COMPOSE_RUN=docker-compose run --rm 3m_run
DB_NAME=DA_Serverless

deploy:
	$(COMPOSE_RUN) make _deploy

clean:
	$(COMPOSE_RUN) make _clean

cleanDocker:
	docker-compose down --remove-orphans

_deploy:
	bash scripts/tf_targets.sh deploy

_clean:
	bash scripts/tf_targets.sh clean
