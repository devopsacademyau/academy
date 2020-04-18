.SILENT:
TF_VAR_github_token?=

	# Check for specific environment variables
env-%:
	@ if [ "${${*}}" = "" ]; then \
			echo "Environment variable $* not set"; \
			exit 1; \
	fi

init: env-TF_VAR_github_token
	docker-compose run --rm terraform init
.PHONY: init
 
apply: env-TF_VAR_github_token
	@echo "+++ :terraform: Terraform Apply"
	docker-compose run --rm \
		-e TF_VAR_github_token=$(TF_VAR_github_token) \
		terraform apply .terraform-plan
.PHONY: apply
 
plan: env-TF_VAR_github_token
	@echo "+++ :terraform: Terraform Plan"
	docker-compose run --rm \
		-e TF_VAR_github_token=$(TF_VAR_github_token) \
		terraform plan -out=.terraform-plan
.PHONY: plan
