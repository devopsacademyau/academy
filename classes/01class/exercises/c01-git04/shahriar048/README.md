# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
> Sensitive information, i.e. credentials are added to the repo.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
> It will not be enough because the data will still persist in the repo and can be extracted from history.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
> Same as above, the data will still remain in the repo and can be accessed from history.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
> We need to rewrite the history and force push.

5. Which commands would you use? Explain what the command does.

```
# Using `filter-branch`

# delete my_env.txt
git filter-branch --index-filter "git rm --cached --ignore-unmatch my_env.txt"

# force push to remote
git push origin --force --all
```

```
# Using `filter-repo` (recommended approach)

# delete my_env.txt
git filter-repo --invert-path --path my_env.txt

# force push to remote
git push origin --force --all
```

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)