DOCKER_RUN=docker-compose run --rm
TF_VARS=c06-serverless.tfvars
TF_PLAN=c06-serverless.tfplan
DB_NAME=DA_Serverless

plan: init 
	$(DOCKER) terraform plan -var-file=$(TF_VARS) -out=$(TF_PLAN)
.PHONY: plan

deploy: init plan  
	$(DOCKER) terraform apply $(TF_PLAN)
.PHONY: deploy

clean:
	$(DOCKER) terraform destroy 
.PHONY: clean

ssm-put:
	$(DOCKER) scripts/ssm-put.sh

ssm-get:
	echo "Getting your API KEY"
	$(DOCKER) scripts/ssm-get.sh


init:
	$(DOCKER) terraform init
.PHONY: init


