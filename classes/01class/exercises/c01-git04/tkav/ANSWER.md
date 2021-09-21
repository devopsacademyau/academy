# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

Sensitive data is in the repository and they should not be included in the repo ever.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No, the file containing the sensitive info still exists in the git history. 

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No, this also doesn't remove the file from the git history.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

Firstly change the password!
```
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch my_env.txt" \
  --prune-empty --tag-name-filter cat -- --all
  git push --force --verbose --dry-run
  git push --force
```
Add the file to `.gitignore` if it's still required by the project locally.

5. Which commands would you use? Explain what the command does.

```
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch my_env.txt" \
  --prune-empty --tag-name-filter cat -- --all
  git push --force --verbose --dry-run
  git push --force
```

This will rm the file `my_env.txt` from git history and force push the changes to remove the file completely from the repo and git history.


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)