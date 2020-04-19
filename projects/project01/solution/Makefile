
init: 
	terraform init

plan: init
	terraform plan -out=.terraform-plan

apply: plan
	terraform apply .terraform-plan

destroy:
	terraform destroy
