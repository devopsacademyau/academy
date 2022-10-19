#!/bin/bash

# Output: 
# - passed.txt
# - failed.txt with error message

set -ex
echo "Assert"

git grep -r -e 'SUPERSECRET' $(git rev-list --all) > out.txt || true

if [ -s out.txt ]
then
        echo FAILED
else
        echo PASSED
fi