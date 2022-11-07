#!/bin/sh
secret_file="my_env.txt"
if [[ -f "/exercise/$secret_file" ]];then
    echo "Secret file $secret_file still exists. Please update your code and submit again."
    exit 1;
fi;

echo "SUMMARY: ### Exercise completed :rocket:"
echo "SUMMARY: Secret file $secret_file not found. Well done cleaning all your secrets."