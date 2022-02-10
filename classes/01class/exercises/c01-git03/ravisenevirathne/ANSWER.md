# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, after initialisation of the local git repo folder size was 112KB. After creating the large file folder size increased to 10MB and again it increased to 20MB after the first commit. 


2. What is the reason for this problem?

Git keeps track of commits history. After each commit it create another copy of files that have been changed. So in this case it create another copy of file and it makes folder size increased to 20MB


3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

One of the command can be use to remove git history is “git revert” which create another commit to undone the previous commit

$Git log 

$Git revert <commit#>


4. What are the consequences of the previous action?

Once you changed git history in local it will not be updated on remote until you push it to origin branch.  So other users might have already pulled and working on the old repo.  To solve this issue,  other users can pull the latest version before pushing new changes to the branch.  Alternatively they can use “git pull -rebase” command in this case.

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
