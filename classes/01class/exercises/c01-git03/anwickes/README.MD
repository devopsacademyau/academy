# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

It doubled in size. Instead of only adding 10mb, it added 20mb.


2. What is the reason for this problem?

It added a copy of the file to the history in .git.


3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

> git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD


4. What are the consequences of the previous action?

Changes can not be undone and are such, not recommended.
git filter-repo is preferred as it has better performance and scales more efficiently.


***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)