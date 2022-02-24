DOCKER = docker-compose run --rm
TF_PLAN = c06-serverless01.tfplan
DB_NAME = DA_Serverless

.PHONY: plan
plan: _ssm _init
	$(DOCKER) terraform plan -out=$(TF_PLAN)

.PHONY: deploy

deploy: _ssm _init plan
	$(DOCKER) terraform apply $(TF_PLAN)

clean:
	$(DOCKER) terraform destroy
.PHONY: clean

_init:
	$(DOCKER) terraform init
.PHONY: _init

_ssm:
	$(DOCKER) aws ssm put-parameter \
		--name DB_NAME \
		--value $(DB_NAME) \
		--type SecureString \
		--overwrite \
		--region ap-southeast-2
.PHONY: _ssm