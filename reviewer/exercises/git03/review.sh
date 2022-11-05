#!/bin/sh
secret_file="my_env.txt"
if [[ -f "/exercise/$secret_file" ]];then
    echo "fail";
    exit 1;
fi;