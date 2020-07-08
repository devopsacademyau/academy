# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> He's worried about the sensitive data information present in that file. In that case, credentials.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> No. The sensitive information still present in the history and could be retrieved from there.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

> No. It's a different approach with the same result as above. The data still in the history.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

> It's necessary to rewrite the history and (force) push to remove the entries from the remote history.

5. Which commands would you use? Explain what the command does.

> Using `filter-branch`

To completely remove the entire file from the history
```
$ git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch my_env.txt" \
  --prune-empty --all
```

To remove only the secret from the file and replace with "FILL_IT_WITH_A_PASSWORD"
```
$ git filter-branch --tree-filter \
  "sed -i 's/pass1234/FILL_IT_WITH_A_PASSWORD>/g' my_env.txt" \
  --all
```

> Or... using `filter-repo`
```
$ git filter-repo --path <PATH_TO_YOUR_FILE_WITH_SENSITIVE_DATA> --invert-paths
```

> After choose one of the options above, force push to remote
```
$ git push origin --force --all
```

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)