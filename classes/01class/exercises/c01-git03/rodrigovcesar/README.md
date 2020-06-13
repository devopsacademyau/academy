# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, before it was 168K; after adding, it went to 197M. After removing the file and reset, I still had 98M inside the .git folder. 

2. What is the reason for this problem?
Git keeps a copy of the file inside the object folder (path .git/objects) for history.


3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

First execute locally the command below
`git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch `*path_to_giant_file*`" --prune-empty --tag-name-filter cat -- --all`


After, you can force a push to remote rewriting the history

`git push origin --force --all`

*source - https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository*


4. What are the consequences of the previous action?
You can impact the work of the other collaborators on your project, since you're rewriting the whole history to remove the file or sensitive data.

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)