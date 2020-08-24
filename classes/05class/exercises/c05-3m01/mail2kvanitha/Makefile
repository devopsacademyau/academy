export BUCKET_NAME ?= test
DOCKER_COMPOSE=docker-compose run --rm 3mdemo

.PHONY:create_bucket
create_bucket:
	${DOCKER_COMPOSE} sh ./scripts/create_bucket.sh

.PHONY:delete_bucket
delete_bucket:
	${DOCKER_COMPOSE} sh ./scripts/delete_bucket.sh

.PHONY:list_bucket
list_bucket:
	${DOCKER_COMPOSE} aws s3 ls

.PHONY:check_container
check_container:
	${DOCKER_COMPOSE} pwd && echo "Hello" > test.txt && ls -l

.PHONY:create_docker
check_docker:
	@echo "Docker Images"
	@echo "============="
	@docker image ls -a
	@echo "\nDocker Containers Running"
	@echo "========================="
	@docker ps -a

.PHONY:clean_docker
clean_docker:
	-@docker-compose down --remove-orphans
	-@docker volume prune -f
	-@bash ./scripts/cleanup.sh && echo "\n"
	-@docker image ls -a && echo "\n"
	-@docker ps -a
