# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> Because the `my_env.txt` file contains sensitive data. It should not be added into the git repo. 


2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> No. Git keeps the history of the changes made to the repo so anyone who has access to the repository can checkout the previous commit and read the sensitive data.


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

> No. It only removes the file from the working tree and the repository still contains the objects of this folder.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

> If you commit sensitive data, such as a password or SSH key into a Git repository, you can remove it from the history. To entirely remove unwanted files from a repository's history you can use the `git filter-branch`.

5. Which commands would you use? Explain what the command does.
> To remove the file from all branches that might have it in their history tree: 

```bash 
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch my_env.txt' --prune-empty --tag-name-filter cat -- --all
```

> At the end, don't forget to push the changes to the repository with --force, since this is not a fast forward commit, and the whole history within the commits range we filtered will be rewritten.

```bash 
git push origin master --force
```

> To dereference, expire reflog (which by default is 90 days) and force garbage collect, you can do:

```bash 
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
```

> You'll need to make sure all branches and tags are pushed to remote (unless you're pushing to a new repo).

```bash 
git push origin --force --all
git push origin --force --tags
```
   
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)