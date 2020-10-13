#!/bin/bash

if [ ${1} == 'create_param' ]; then
    aws ssm put-parameter --name DB_NAME --value ${2} --type String --overwrite 1> /dev/null
    exit
elif [ ${1} == 'delete_param' ]; then
    aws ssm delete-parameter --name DB_NAME 1> /dev/null
    exit
else
    echo "Try aws_targets.sh {create_param | delete_param} {param_name}"
    exit 1
fi
