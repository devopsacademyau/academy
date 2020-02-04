ORG_NAME?=devopsacademyau
REPO_NAME?=academy
FOLDER_NAME?=

presentation:
	docker-compose up -d
	sleep 5
	open "http://localhost:9000/${ORG_NAME}/${REPO_NAME}?p=${FOLDER_NAME}"

stop:
	docker-compose down

pitchme_to_readme:
#Example: FOLDER_NAME=classes/01class/git/ make pitchme_to_readme
ifdef FOLDER_NAME
	sed '/^@/d' ${FOLDER_NAME}/PITCHME.md > ${FOLDER_NAME}/README.md	
	sed -e s~'${FOLDER_NAME}'~~g ${FOLDER_NAME}/README.md > ${FOLDER_NAME}/README_out.md	
	mv ${FOLDER_NAME}/README_out.md ${FOLDER_NAME}/README.md	
	rm ${FOLDER_NAME}/README_out.md	| true 
else
	echo "FOLDER_NAME is required"
	exit 2
endif