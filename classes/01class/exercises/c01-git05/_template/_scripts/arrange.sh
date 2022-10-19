#!/bin/bash
set -ex
echo "Arrange"

rm -rf ./.git
git init
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

touch README.md
git add README.md 
git commit -m "Initial"

echo "password=SUPERSECRET" >> pwd.txt
git add pwd.txt
git commit -m "This contains a secret PWD"

touch file1.txt file2.txt file3.txt
git add file1.txt file2.txt file3.txt
git commit -m "Add other project files"