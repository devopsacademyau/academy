export ORG_NAME?=devopsacademyau
export REPO_NAME?=academy
export BRANCH_NAME?=
export FOLDER_NAME?=

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