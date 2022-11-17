.SILENT:

export ORG_NAME?=devopsacademyau
export REPO_NAME?=academy
export BRANCH_NAME?=
export FOLDER_NAME?=
RUNNER = docker-compose run --rm
TF_VAR_github_token?=

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

dashboard:
	$(RUNNER) python-da /app/scripts/dashboard/run.sh
	$(RUNNER) aws-cli /app/scripts/dashboard/publish.sh


presentation:
	docker-compose up -d
	sleep 5
	open "http://localhost:9000/${ORG_NAME}/${REPO_NAME}?p=${FOLDER_NAME}"

stop:
	docker-compose down

pitchme_to_readme:
  #Example: FOLDER_NAME=classes/01class/git/ make pitchme_to_readme
	#Example: FOLDER_NAME=classes/01class/git/ BRANCH_NAME=MY_BRANCH make pitchme_to_readme
	bash scripts/pitchme_to_readme.sh

rtr-cleanup:
	$(ROOT_DIR)/scripts/rtr-cleanup.sh ${GH_USER} ${GH_TOKEN}

gh-plan: init plan
gh-apply: init plan apply
.PHONY: gh-plan gh-apply

init:
	$(RUNNER) gh-terraform init
.PHONY: init

plan: .env-TF_VAR_github_token
	$(RUNNER) gh-terraform plan -parallelism=1 -out=.terraform-plan
.PHONY: plan

apply:
	$(RUNNER) gh-terraform apply -parallelism=1 .terraform-plan
.PHONY: apply

shell:
	$(RUNNER) --entrypoint "" gh-terraform sh
.PHONY: shell

.env-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

exercises:
	$(RUNNER) exercises
.PHONY: exercises

exercises-sh:
	$(RUNNER) --entrypoint "" exercises bash
