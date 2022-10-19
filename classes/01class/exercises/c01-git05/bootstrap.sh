#!/bin/bash

USERNAME=$1

# [ -z "${USERNAME}" ] || echo "Invalid argument 1 (username). Usage: ./bootstrap <username>" && exit 2

mkdir -p ./${USERNAME} 
cp -r ./_template/** ./${USERNAME}
echo "Folder '${USERNAME}' created..."
echo "DONE"