#!/usr/bin/env bash
echo "## uname" > output.txt
uname -a >> output.txt
echo "## git " >> output.txt
git --version >> output.txt
echo "## docker " >> output.txt
docker --version >> output.txt
echo "## terraform " >> output.txt
terraform --version >> output.txt
echo "## aws " >> output.txt
aws --version >> output.txt

