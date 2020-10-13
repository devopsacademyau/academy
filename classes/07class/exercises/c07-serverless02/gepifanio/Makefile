DOCKER=docker-compose run --rm
TF_PLAN=lambda.tfplan

plan: _init
	$(DOCKER) terraform plan -out=$(TF_PLAN)
PHONY: plan

apply:_init plan
	$(DOCKER) terraform apply $(TF_PLAN)
PHONY: apply

destroy:
	$(DOCKER) terraform destroy
PHONY: destroy

_init:
	$(DOCKER) terraform init
PHONY: _init