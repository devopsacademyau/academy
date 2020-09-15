RUNNER ?= docker-compose run --rm -T
DB_NAME ?= DA_Serverless
PROJECT_NAME ?= devops_serverless01

init: pull-required-images
	@$(RUNNER) devops-toolbox 'make _init'
.PHONY:init

apply:
	@$(RUNNER) devops-toolbox 'make _apply'
.PHONY:apply

deploy: init
	@$(RUNNER) devops-toolbox 'make _deploy'
.PHONY:deploy

clean:
	@$(RUNNER) devops-toolbox 'make _clean'
.PHONY:clean

warm-up:
	@echo "\e[32mCreating new customer...\e[0m \n"
	@$(MAKE) -s create-customer FIRST_NAME="Linus" LAST_NAME="Torvalds" EMAIL="fake@mail.com"  
	@echo "\n \e[32mListing table content\e[0m \n"
	@$(MAKE) -s list-customers
.PHONY:warm-up

create-customer:
	@$(RUNNER) \
		-e FIRST_NAME=$(FIRST_NAME) \
		-e LAST_NAME=$(LAST_NAME) \
		-e EMAIL=$(EMAIL) \
		devops-toolbox ./scripts/create-customer.sh
.PHONY:create-customer

list-customers:
	@$(RUNNER) devops-toolbox 'make _list-customers'
.PHONY:list-customers

pull-required-images:
	@docker-compose pull
.PHONY:pull-required-images

kick-n-run:
	@$(RUNNER) devops-toolbox ./scripts/kick-n-run.sh
	@$(MAKE) -s warm-up
.PHONY:kick-n-run

_init:
	@cd terraform && terraform init
.PHONY:_init

_apply:
	@cd terraform && terraform apply
.PHONY:_apply

_deploy:
	@$(MAKE) -s _put-db-name-parameter
	@cd terraform && terraform apply -auto-approve
.PHONY:_deploy

_destroy:
	@cd terraform && terraform destroy -auto-approve
.PHONY:_deploy

_clean:
	@$(MAKE) -s _destroy
	@rm -rf ./terraform/files
	@$(MAKE) -s _remove-db-name-parameter
.PHONY:_clean

_put-db-name-parameter:
	@aws ssm put-parameter \
		--name '/${PROJECT_NAME}/DB_NAME' \
		--value ${DB_NAME} \
		--overwrite \
		--type String \
		--no-cli-pager 1>/dev/null
.PHONY:_put-db-name-parameter

_remove-db-name-parameter:
	@aws ssm delete-parameter \
		--name '/${PROJECT_NAME}/DB_NAME' \
		--no-cli-pager
.PHONY:_remove-db-name-parameter

_list-customers:
	@aws dynamodb scan \
		--table-name DA_Serverless \
		--output json \
		| jq '[.Items[] | {id: .id.S, firstname: .firstname.S, lastname: .lastname.S, email: .email.S, created_at: .created_time.S}]'
.PHONY:_list-customers