#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "${PROJECT}" == "" ] 
then
    echo ** PROJECT Variable is empty. Exiting...  **
    exit 1
fi

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'
GITHUB_URL="https://api.github.com"
PROJECT_URL="${GITHUB_URL}/repos/devopsacademyau/${PROJECT}"
PREVIEW_HEADER=(-H "Accept: application/vnd.github.inertia-preview+json")
if [ "${GH_USER}" == "" ] || [ "${GH_TOKEN}" == "" ]
then
    TOKEN=""
    echo ** NO AUTH **
else
    TOKEN="-u ${GH_USER}:${GH_TOKEN}"
    echo ** Using GitHub token **
fi

COLUMNS_URL=`curl ${TOKEN} ${PROJECT_URL}/projects \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    --silent| \
    jq -r --arg PROJECT "${PROJECT}" '.[] | select(.name == $PROJECT)|.columns_url'`

BACKLOG_COLUMN=`curl ${TOKEN} ${COLUMNS_URL} \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    --silent| \
    jq -r '.[] | select(.name == "Backlog")|.id'`

ls issues |while read ISSUE_FILE
do
    CARD_TITLE=`cat issues/${ISSUE_FILE} |jq -r .title`
    ISSUE_ID=`curl ${TOKEN} -X POST ${PROJECT_URL}/issues -d @issues/${ISSUE_FILE} \
        -H "Content-Type: application/json" \
        --silent \
        |jq .id`

    OBJECT="{\"content_id\": $ISSUE_ID, \"content_type\": \"Issue\"}"
    curl ${TOKEN} -H "Accept: application/vnd.github.inertia-preview+json" \
        -X POST ${GITHUB_URL}/projects/columns/$BACKLOG_COLUMN/cards \
        --header "Content-Type: application/json" \
        -d "$OBJECT" > /dev/null 2>&1
        echo -e "**${GREEN}Card \"${CARD_TITLE}\" was created successfully in the Backlog Column of project ${PROJECT} **${NC}"
done

