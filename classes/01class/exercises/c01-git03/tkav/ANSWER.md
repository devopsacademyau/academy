# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Ran `mkfile -n 100m file.txt`
When the file was added it went from 116KB to 104.9MB.
On commit it went to 105.4MB.
After reverting the size was still over 100MB.

2. What is the reason for this problem?

Git is keeping a copy in the history.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD

4. What are the consequences of the previous action?

It removes the file from the git history

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)