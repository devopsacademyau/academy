DOCKER=docker-compose run --rm

init:
	$(DOCKER) terraform init
PHONY: init

plan:  
	$(DOCKER) terraform plan -out terraform-plan 
PHONY: plan

apply: 
	$(DOCKER) terraform apply "terraform-plan"
PHONY: apply

ssm-key:
	$(DOCKER) aws ssm put-parameter \
		--name DB_NAME \
		--value DA_Serverless \
		--type SecureString \
		--overwrite \
		--region ap-southeast-2
PHONY: ssm-key

deploy: 
	make ssm-key
	make init
	make plan
	make apply


wipe:
	$(DOCKER) terraform destroy -auto-approve
PHONY: wipe
