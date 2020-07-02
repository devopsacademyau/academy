# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
   Yes, once I added the big file, the size jumped from a few KBs to 20M. However, even though I reverted the addition through git reset --hard HEAD^, the folder size was kept at 20M.

2. What is the reason for this problem?
   The reason for that is the command that I executed only pointed the HEAD to a previous position within the git history, but since git keeps a log/history of all my changes, the file was kept so I could also point my HEAD back to the position where/when the file existed, in case I wanted to revert my previous "git reset --hard HEAD^" action.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use?

   You could perform this task by using git filter-repo.
   The command would be: git filter-repo --force --path file.txt --invert-paths

4. What are the consequences of the previous action?
   As a consequence, the command changes the commits starting from when/where the file was added, and therefore, all developers that are working on the same project, will have to pull the changes. Another consequence is that there's no way to roll-back this operation. The file is gone for good.

---

Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
