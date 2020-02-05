#!/bin/bash
set -e 

if [[ -n ${FOLDER_NAME} ]]
then
	set -x
	sed '/^@/d' ${FOLDER_NAME}/PITCHME.md > ${FOLDER_NAME}/README.md	
	sed -e s~${FOLDER_NAME}~~g ${FOLDER_NAME}/README.md > ${FOLDER_NAME}/README_out.md	
	mv ${FOLDER_NAME}/README_out.md ${FOLDER_NAME}/README.md	
	rm ${FOLDER_NAME}/README_out.md	| true 
	
	URL="https://gitpitch.com/${ORG_NAME}/${REPO_NAME}"
	
	if [[ -n ${BRANCH_NAME} ]] 
	then
		URL="${URL}/${BRANCH_NAME}"
	fi
	
	URL="${URL}?p=${FOLDER_NAME}"

	set +x
	echo -e "#### Presentation URL: ${URL}\n\n$(cat ${FOLDER_NAME}/README.md)" > ${FOLDER_NAME}/README.md
else
	echo "FOLDER_NAME is required"
	exit 2
fi