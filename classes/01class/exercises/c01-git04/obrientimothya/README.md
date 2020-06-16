# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
   The file contains sensitive password information. Anyone with access to the remote repo could view the information and potentially use it to access sensitive data.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
   No. Git maintains history information of all files committed to a repository. Therefore, previous commit history kept by the remote repo will still contain copies of the `my_env.txt` file.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
   No. Regardless of the changes performed in the current commit (add, remove or change), previous commit history stored in the remote repo will still contain copies of the file. Anyone with access to the remote can view the commit history, allowing them to see the previous state of the `my_env.txt` file.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
   To completely remove a file from a remote, is necessary to clean a copy of the repository locally, then force overwrite the remote repository completely with the new 'clean' local.

5. Which commands would you use? Explain what the command does.

```
# clone the latest remote to local
git clone <remote-repo-with-my_env.txt>
# The filter-branch command is used to rewrite branch(es)
# Filter commands can be applied as the branches are being
# rewritten, mapping new changes to each branch.
# In this case, the git rm command is used to
# filter the my_env.txt file from all branches, removing
# it before each branch history is rewritten.
# This action results in a newly rewritten local git history, excluding
# all copies and references to my_env.txt
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch my_env.txt" \
  --prune-empty --tag-name-filter cat -- --all
# if the file should never be written again to remote
# add it to .gitignore to prevent this
echo 'my_env.txt' >> .gitignore
git add .gitignore
git commit -m "Added file.txt to .gitignore"
# force the remote repo to be overwritten by the
# filtered local (now excluding my_env.txt)
git push origin --force --all
# if tags were present, rewite them too:
git push origin --force --tags
```

---

Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
