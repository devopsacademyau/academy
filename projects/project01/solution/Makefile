TF_VARS_FILE ?= main.tfvars
init: 
	terraform init

plan: init
	terraform plan -var-file=$(TF_VARS_FILE) -out=.terraform-plan

apply: plan
	terraform apply .terraform-plan

destroy:
	terraform destroy -var-file=$(TF_VARS_FILE) 
