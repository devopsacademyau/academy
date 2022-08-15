# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

The file contains secrets which should not be visible to anyone. Secrets should never be committed to a repository.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No, both the initial commit and the remove commit will be in git history so it can still be found by looking at logs

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No, the older file will remain in history

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

The history on your local repo would need to have all history of the file removed, then the changes would need to be pushed to the remote repository

5. Which commands would you use? Explain what the command does.
   
Github recommends use of the tool [git filter-repo](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository#using-git-filter-repo) 

1. `git clone XXXX` - clone the repo to avoid local changes conflicting with remote changes
2. `git filter-repo --invert-paths --path my_env.txt` - use the filter-repo tool to remove the troublesome file
3. `echo "my_env.txt" >> .gitignore && git add .gitignore && git commit -m 'Add my_env.txt to .gitignore'` - add my_env.txt to .gitignore and commit it to repo
4. `git push origin --force --all` - force push the changes to all branches to ensure the file is removed everywhere from repos and history

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
