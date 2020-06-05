.SILENT:

export ORG_NAME?=devopsacademyau
export REPO_NAME?=academy
export BRANCH_NAME?=
export FOLDER_NAME?=
RUNNER = docker-compose run --rm
TF_VAR_github_token?=

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
dashboard:   # Creates a scorecard dashboard in CSV. You can pass GH_USER and GH_TOKEN to authenticate in GitHub
	$(ROOT_DIR)/scripts/dashboard.sh ${GH_USER} ${GH_TOKEN}

new_dashboard:
	cd scripts/dashboard
	docker build -t python:da .
	./dashboard.sh
	docker run -v ${PWD}:/app python:da /app/run.sh

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
	$(RUNNER) gh-terraform plan -out=.terraform-plan
.PHONY: plan

apply:
	$(RUNNER) gh-terraform apply .terraform-plan
.PHONY: apply

.env-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi