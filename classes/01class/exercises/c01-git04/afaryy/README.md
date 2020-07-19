# c01-git04


## Secrets (c01-git04)

Perform the following commands:
1. In the same repository of the previous exercise:
2. Add a file called `my_env.txt` that contains
    ```
    SERVICE_NAME=account-management
    ENVIRONMENT=prod
    PASSWORD=pass1234
    ```
1. Commit it to your local repository
2. Check the log with `git log`

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?  
You should not include sensitive data like password in yout file.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?  
No, the file including the password info still exists in git history.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?  
No, this also can not remove the git history of the file.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?   
The "git filter-branch" works good to remove your file with sensitive data from the history of your repository. And then force-push it to overwrite the history in the remote.

5. Which commands would you use? Explain what the command does.


```
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch PATH-TO-YOUR-FILE" \
  --prune-empty --tag-name-filter cat -- --all  

echo "YOUR-FILE" >> .gitignore
git add .gitignore
git commit -m "Add YOUR-FILE to .gitignore"
git push origin --force --all
git push origin --force --tags
git rebase ...for collaborators
git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
```

Ref: https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
