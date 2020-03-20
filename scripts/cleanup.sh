BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'
GITHUB_URL="https://api.github.com/repos/devopsacademyau/academy"
if [ "${GH_USER}" == "" ] || [ "${GH_TOKEN}" == "" ]
then
    echo "GH_USER and GH_TOKEN variables missing"
    exit
else
    TOKEN="-u ${GH_USER}:${GH_TOKEN}"
fi

curl ${TOKEN} "${GITHUB_URL}/issues?state=closed&labels=ready%20to%20review" --silent| \
    grep "\"number\":"| \
    cut -f2 -d":"| \
    cut -f1 -d ","| \
    cut -f2 -d" " | \
    sort -h | \
    while read PRID
    do
        curl ${TOKEN} -X DELETE ${GITHUB_URL}/issues/${PRID}/labels/ready%20to%20review > /dev/null 2>&1
        echo -e "**${GREEN}Ready to Review ${BLUE} tag removed from  in PR ${PRID} **${NC}"
    done
