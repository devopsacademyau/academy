# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

**Yes, it doubles size after commit the file.txt with 100Mb, with DU showing 200Mb+.**

2. What is the reason for this problem?

**The .git directory inside the repo has all historical files compressed. Because this file.txt is random, the compression is not effective.**

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

**You need to use git filter-branch or the BFG Repo-Cleaner open source tool**

**Using filter-branch**

**Inside your local Repo use:**

`git filter-branch --force --index-filter \`
 ` git rm --cached --ignore-unmatch 'PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA" \`
  `--prune-empty --tag-name-filter cat -- --all`

**Force git to push all changes to the remote repository**

`git push origin --force --all`

Source: https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository

**Using the BFG**

`bfg --delete-files YOUR-FILE-WITH-SENSITIVE-DATA`

**Learn more: https://rtyley.github.io/bfg-repo-cleaner/**




4. What are the consequences of the previous action?

**You will delete the historic file, you can't recovery this file. In addtion you will change SHA from the existing commits. It will affect the opened pull requests, so it is a best practice close all PRs before run these commands**.


***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
