COMPOSE_RUN_SHELL= docker-compose run --rm shell
DB_NAME=DA_Serverless
.PHONY: buildzip
buildzip:
	$(COMPOSE_RUN_SHELL) make _buildzip
_buildzip:
	mkdir terraform/lamda_zip;cd src;zip ../terraform/lamda_zip/remove_untagged_instance.zip remove_untagged_instance.py;

	
.PHONY: plan #Execute Terraform Plan and output the plan
plan:buildzip
	$(COMPOSE_RUN_SHELL) make _plan

.PHONY: _plan #bash command to run the plan
_plan:
	cd terraform;terraform init;terraform plan  -out serverless_07_02


.PHONY: deploy #Execute the Terraform Apply to creates the network and ECR
deploy: plan
	$(COMPOSE_RUN_SHELL) make _deploy

.PHONY: _deploy #bash command to run the plan
_deploy:
	cd terraform; terraform apply serverless_07_02;

.PHONY: startec2
startec2:
	$(COMPOSE_RUN_SHELL) aws ec2 run-instances --image-id ami-03686c686b463366b --instance-type t2.micro


.PHONY: start_ec2_with_tag
start_ec2_with_tag:
	$(COMPOSE_RUN_SHELL) aws ec2 run-instances --image-id ami-03686c686b463366b --instance-type t2.micro --tag-specifications 'ResourceType=instance,Tags=[{Key=CostCentre,Value=121212}]'

.PHONY: stopec2
stopec2:
	$(COMPOSE_RUN_SHELL) aws ec2 terminate-instances --instance-ids $(instanceids)

.PHONY: clean #Deletes the AWS infra created by terraform
clean:
	$(COMPOSE_RUN_SHELL) make _clean


.PHONY:_clean
_clean:
	cd terraform;terraform destroy;