DOCKER_RUN=docker-compose run --rm
TF_VARS=c07-serverless02.tfvars
TF_PLAN=c07-serverless02.tfplan

plan: init 
	$(DOCKER) terraform plan -var-file=$(TF_VARS) -out=$(TF_PLAN)
.PHONY: plan

deploy: init plan  
	$(DOCKER) terraform apply $(TF_PLAN)
.PHONY: deploy

clean:
	$(DOCKER) terraform destroy 
.PHONY: clean

ec2-run:
	$(DOCKER) scripts/ec2-run.sh

ec2-check:
	$(DOCKER) scripts/ec2-check.sh

sns-subscribe:
	$(DOCKER) scripts/sns-subscribe.sh

init:
	$(DOCKER) terraform init
.PHONY: init


