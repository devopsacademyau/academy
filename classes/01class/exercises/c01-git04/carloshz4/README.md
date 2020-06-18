# c01-git04

## Questions (answer inline)

### 1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

Password is in clear text and accessible to anyone who can reach this the remote repo. Even after the problem is fixed, anyone who had cloned the repo before the fix would have access to the sensitive data.  This sensitive data could become a security breach.




### 2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

It won't be enough because the previous data will remain in the remote repo's history. 




### 3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

It is not enough because the previous file and information still remains in the repo's history and can be accessed by anyone over the internet (if it is a public repo).




### 4. How to fix this? How do you remove something from Git history when it is in the remote repository?

The file needs to be removed from the remote repo's history using "git filter-branch" .  It'll
rewrite the repository's history, which changes the SHAs for existing commits altered and any dependent commits.



### 5. Which commands would you use? Explain what the command does.

Assuming you have cloned and move to the repo's working directory rewrite the repo's history with this command:

```
git filter-branch --force --index-filter   "git rm --cached --ignore-unmatch my_env.txt"   --prune-empty --tag-name-filter cat -- --all
```

Where the arguments do:

- Force Git to process, but not check out, the entire history of every branch and tag.
- Remove my_env.txt, as well as any empty commits generated as a result.
- Overwrite existing tags.


Then to prevent the file with sensitive data to be pushed, add it to the .gitignore file:

```
touch .gitignore
echo "my_env.txt" >> .gitignore
```

Then add and commit .gitignore

```
git add .gitignore
git commit -m "Add my_env.txt to .gitignore"
```

Then force-push the changes from the local repo's history to the remove repo, including all branches.

```
git push origin --force --all
```


***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
