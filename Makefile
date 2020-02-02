ORG_NAME?=devopsacademyau
REPO_NAME?=academy
FOLDER_NAME?=

presentation:
	docker-compose up -d
	sleep 5
	open "http://localhost:9000/${ORG_NAME}/${REPO_NAME}?p=${FOLDER_NAME}"

stop:
	docker-compose down