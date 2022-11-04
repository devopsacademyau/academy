# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

They are worried that you are leaking private information and credentials. Someone else will now be able see the credentials within the repo and use as they wish.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No, because you previously commited the file so it is now stored in the git history.


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No because the history of this file is still cached by git and can be reverted at any time.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

You could use something like git filter-repo tool or the BFG Repo-Cleaner open source tool.

5. Which commands would you use? Explain what the command does.

BFG, i would do the following to remove all signs of the file in repo/history. After this a force push to ensure this is updated in the remote repo
```
bfg --delete-files file.txt my-repo.git
git push --force
```
Filter-repo, I would use the following to do the same. After this a force push to ensure this is updated in the remote repo
```
git filter-repo --invert-paths --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA
git push --force
```

More info here - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
