#!/bin/bash
test=../classes/01class/exercises/c01-git04/starkmatt/c01-git04.txt
echo '----Checking if secret exists----'

verify=$(awk '/SECRET=/{print $1}' "$test")

if [ -n "$verify" ];
then
    echo "Secret Exists!"
else
    echo "Secret does not exist"
fi