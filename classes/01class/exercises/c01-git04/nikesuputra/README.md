# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> If someone accesses our repository, they will also be able to access our sensitive data inside `my_env.txt`

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> It's not, because Git will still have our commit history, and any the previous version of the file is also stored in Git history.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

> It's not, because Git will still have the history of the file.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

> We can use `git filter-branch` or `git filter-repo` or `BFG Repo Cleaner` to remove the file from Git history, and then force-push it to overwrite the history in remote repository.

> We also need to consider any sensitive information, such as password in the previous commit as compromised, so it's recommended to change it to a new one.

5. Which commands would you use? Explain what the command does.
```
# Remove the file using this command
$ git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch <path_to_file>' HEAD

# Push the changes to remote branches with this command
$ git push origin --force --all

# Force all objects in local repository to be dereferenced and garbage collected with the following commands
$ git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
$ git reflog expire --expire=now --all
$ git gc --prune=now
```

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
