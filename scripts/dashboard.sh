BASEDIR=$PWD
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m'
GITHUB_URL="https://api.github.com/repos/devopsacademyau/academy"
if [ "${GH_USER}" == "" ] || [ "${GH_TOKEN}" == "" ]
then
    TOKEN=""
else
    TOKEN="-u ${GH_USER}:${GH_TOKEN}"
fi

mkdir ${BASEDIR}/results
curl ${TOKEN} ${GITHUB_URL}/pulls?state=open --silent| \
    grep "\"number\":"| \
    cut -f2 -d":"| \
    cut -f1 -d ","| \
    cut -f2 -d" " > ${BASEDIR}/prids.txt
> ${BASEDIR}/prids-authored.txt
cat ${BASEDIR}/prids.txt|while read PRID
do
    PR_AUTHOR=`curl ${TOKEN} ${GITHUB_URL}/pulls/${PRID} --silent| \
        jq -r .user.login| \
        tr '[:upper:]' '[:lower:]'`
    echo "${PRID};${PR_AUTHOR}" >> ${BASEDIR}/prids-authored.txt
done
cat ${BASEDIR}/students.txt|while read STUDENT
do
    LIST="${LIST}${STUDENT};"
    echo "$LIST" > ${BASEDIR}/results/final.txt
done
cat ${BASEDIR}/labs.txt |while read LAB;
do
    > ${BASEDIR}/results/${LAB}.txt
    CLASS=`echo $LAB|cut -c2-3`
    echo "***** Checking for deliveries of $LAB *****"
    cd ${BASEDIR}/../classes/${CLASS}class/exercises/${LAB}
    DONE=""
    cat ${BASEDIR}/students.txt|while read STUDENT
    do
        echo "" > ${BASEDIR}/flag.txt
        ls -l ${STUDENT} > /dev/null 2>&1
        if [ $? -eq 0 ]
        then
            echo -e "${GREEN}** ${LAB} already delivered by ${STUDENT} **${NC}"
            DONE=`cat ${BASEDIR}/results/${LAB}.txt`
            echo "${DONE}D;" > ${BASEDIR}/results/${LAB}.txt
            continue
        else
            cat ${BASEDIR}/prids-authored.txt|grep ${STUDENT}|cut -f1 -d";"|while read PRID
            do
                IS_THIS_LAB=`curl ${TOKEN} ${GITHUB_URL}/pulls/${PRID}/files --silent| \
                    grep raw| \
                    grep ${LAB}`
                if [ $? -eq 0 ]
                then
                    echo -e "${BLUE}** ${LAB} in PR by ${STUDENT} **${NC}"
                    sed "/^${PRID};/d" ${BASEDIR}/prids-authored.txt > ${BASEDIR}/temp.txt
                    mv ${BASEDIR}/temp.txt ${BASEDIR}/prids-authored.txt
                    DONE=`cat ${BASEDIR}/results/${LAB}.txt`
                    echo "${DONE}P;" > ${BASEDIR}/results/${LAB}.txt
                    echo "TRUE" > ${BASEDIR}/flag.txt
                    break
                fi
            done
            FLAG=`cat ${BASEDIR}/flag.txt`
            if [ "$FLAG" != "TRUE" ]
            then
                echo -e "${RED}** ${LAB} was not delivered by ${STUDENT} **${NC}"
                DONE=`cat ${BASEDIR}/results/${LAB}.txt`
                echo "${DONE};" > ${BASEDIR}/results/${LAB}.txt
            fi
        fi
    done
    cat ${BASEDIR}/results/${LAB}.txt >> ${BASEDIR}/results/final.txt
done
cp ${BASEDIR}/results/final.txt ${BASEDIR}/result.csv
rm -rf ${BASEDIR}/results
rm -rf ${BASEDIR}/prids-authored.txt
rm -rf ${BASEDIR}/prids.txt
rm -rf ${BASEDIR}/flag.txt