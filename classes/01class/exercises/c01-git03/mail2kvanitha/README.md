# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
The size of the repo increased significantly after adding the big file

2. What is the reason for this problem?
Git maintains the history of commits of each file/branches, and hence the repo size grows with each commit.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
"git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file HEAD" to remove file from local repository
"git push origin --force --all" to remove file from Remote Origin Master

4. What are the consequences of the previous action?
The --index-filter in the above command will run against the index at the each step in the history. The "rm -rf --cached --ignore-unmatch" will remove the matching filename forcefully. 
The second command will remove the files from remote origin.


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
