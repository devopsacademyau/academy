# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
yes before adding the big file the repo was at 0B after adding it was at 10M, after commit the size doubled

2. What is the reason for this problem?
Git commits are a snapshot of each point in time this can include large files that git cannot create a delta between which can result in repo sizes ballooning

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
if a specific file needs to be removed from the history we can use "filter-branch" and "git rm" to find and remove the file then push the changes back to the remote repo

4. What are the consequences of the previous action?
the file will be removed from the remote git history completely, it can take a while depending on size and complexety of the repo and anyone else working on the repo would need to re-clone the repo to prevent any local copies making it back into main
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)