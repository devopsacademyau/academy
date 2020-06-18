# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
> Yes, the size increased from 96K to 20M.

2. What is the reason for this problem?
> Besides the size of the project files, Git has its own objects (commits, trees and blobs) stored on the file system.
> Git uses these objects to keep track of the different versions of a project.
> The Git objects take up additional disk space. 

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
> One way to change Git history (among others) is to use interactive rebase.
> Steps:
      1. `git log`
      2. Identify the commit that needs to be modified.
      3. `git rebase -i <SHA>`
      4. Choose action (pick, remove, reword, edit, squash, fixup, exec, drop)
      5. Resolve conflicts (if any)
      6. Save and finish rabase
      7. `git push origin <branch> --force` 

4. What are the consequences of the previous action?
> Re-writing the history of a remote repository is risky. 
> Chances are other developers have already pulled in from the older version of the repository.
> This will create mismatch between their work and the latest version of the repository.
> To fix this, all developers need to pull in the latest version of the repository and make necessary changes (resolve conflicts) to align with remote. 

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)