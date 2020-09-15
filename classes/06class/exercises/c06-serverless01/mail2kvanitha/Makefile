CMD=@docker-compose run --rm ubuntu
TF_OUTPUT=c06_serverless_01.tfplan
DB_NAME=DA_Serverless
AWS_DEFAULT_REGION=ap-southeast-2

ssmsetup:
	$(CMD) sh scripts/ssm-put-parameter.sh $(DB_NAME) $(AWS_DEFAULT_REGION)
.PHONY: ssmsetup

ssmget:
	$(CMD) sh scripts/ssm-get-parameter.sh DB_NAME
.PHONY: ssmget

plan: 
	$(CMD) make _plan
.PHONY: plan

_plan: 
	cd terraform; terraform init; terraform plan -out $(TF_OUTPUT) -var db_name=$(DB_NAME);
.PHONY: _plan

deploy: plan
	$(CMD) make _deploy
.PHONY: deploy

_deploy:
	cd terraform; terraform apply $(TF_OUTPUT);
.PHONY: _deploy

clean:
	cd terraform; terraform destroy -auto-approve;
.PHONY: clean
