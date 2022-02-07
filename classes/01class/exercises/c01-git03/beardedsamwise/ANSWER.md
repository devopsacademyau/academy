# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, the size or the repo was 108KB before the big file was created. After the big file was created the size increased to 20MB. 

2. What is the reason for this problem?

Git maintains the history of all commits, meaning the large file still exists in previous commits. 

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

You could run an interactive rebase of the repo to edit the particular commit where the large file was commited. During the rebase you could remove the  large file then amend the previous commit without the large file. 

   - First, get the hash of the commit prior to the commit where the large file was commited with `git log --oneline`
   - Initiate an interactive rebase from the last good commit `git rebase -i d14e1ab` with the hash of the last good commit
   - This will open up a file in your Git editor where you can specify whether you want to edit, drop or perform other actions against each commit (in this case, we'll want to edit the commit where the large file was commited), once modified save the file 
   - Remove the file with `git rm`
   - Commit the changes with `git commit --amend -C HEAD`
     - If the commit is now empty, you may need to add `--allow-empty` to the previous command
   - Finish the rebase with `git rebase --continue`
   - Finally push your changes with `git push`

4. What are the consequences of the previous action?

The previous commits have all been pushed to the remote repo and still exist, which other contributers could be using. The SHA-1 of each commit will change after the interactive rebase and you'll run into an error when you attempt to push the repo with the large file removed. Working around this is complex, for example you could force the commit but if the remote branch has commits from other people that your local branch does not have you will delete their commits. You could force the commit with a lease, but if other contributer already has the changed commits they'll run into merge conflicts due to the change SHA-1s. 

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)