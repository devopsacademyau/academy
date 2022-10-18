#!/bin/bash
test=../classes/01class/exercises/c01-git04/starkmatt/c01-git04.txt
echo '----Checking if File exists----'

function file_check {
if [[ -f $test ]]; then
    echo 'File exists!'
else
    echo 'File doesnt exist'
fi
}

file_check