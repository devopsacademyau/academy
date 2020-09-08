#!/bin/bash

if [ ${#} -eq 0 ]; then
    echo "Try aws_targets.sh {create | delete} {param_name}"
    exit 1
elif [ ${1} == 'create' ]; then
    aws ssm put-parameter --name DB_NAME --value ${2} --type SecureString --overwrite
    exit
elif [ ${1} == 'delete' ]; then
    aws ssm delete-parameter --name DB_NAME
    exit
else
    echo "Try aws_targets.sh {create | delete} {param_name}"
    exit 1
fi
