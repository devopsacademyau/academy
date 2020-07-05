## Big file (c01-git03)

Perform the following commands:
1. Initialize a new git repository **locally** (you don't need to push it)
2. Add a simple README.md text file (`touch README.md`) and commit it
3. Check the commit with `git log`
4. Check the size of the repository directory
    - On the parent, `du -sh .`
5. Add a fairly big file `file.txt` (around 100MB)
    - `dd if=/dev/random of=file.txt count=1024 bs=10257`
6. Add and commit it locally
    - `git add file.txt; git commit -m "Add big file"`
7. Check the size of the repository directory again (take note of this)
    - On the parent, `du -sh .`
8. Revert the commit that added the big file
    - use `git revert`, `git reset` or `git rebase` (e.g. git reset HEAD~1)
9. Check the size of the repository directory again (take note of this)
    - On the parent, `du -h`(21M)

**Questions**

1. Did you notice any difference in the size of the repo before and after adding the big file?  
Yes, the size changed from 58k to 21M. No change of the size happened after resetting the commit.
2. What is the reason for this problem?  
Because resetting can not remove the big file from the git history.
3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use?  

```
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch PATH-TO-YOUR-FILE" \
  --prune-empty --tag-name-filter cat -- --all  
 
echo "YOUR-FILE" >> .gitignore
git add .gitignore
git commit -m "Add YOUR-FILE to .gitignore"

git push origin --force --all
git push origin --force --tags

git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
```
4. What are the consequences of the previous action?  
It will makes your collaborators difficult to push their local work because  of rewriting the history.Tell your collaborators to rebase, not merge, any branches they created off of your old (tainted) repository history. One merge commit could reintroduce some or all of the tainted history that you just went to the trouble of purging.

Ref: https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)