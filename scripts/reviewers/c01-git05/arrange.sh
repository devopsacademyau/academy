#!/bin/bash
set -ex
echo "Arrange"

git init
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

touch README.md
git add README.md
git status
git commit -m "Initial"

echo "password=SUPERSECRET" >> envfile
touch file0.txt
git add .
git status
git commit -m "Adding some variables"

touch file1.txt file2.txt file3.txt
git add .
git status
git commit -m "Add other project files"
