# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
  - Sensitive data exposed in a text file and pushed to a Git repository.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
  - I won't be enough as git will keep references to old snapshots and objects, so the password information can be easily retrieved.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
  - The delete/push operation won't rewrite the git history, so commits to the old file will remain available.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
  - 'git filter-branch' and 'BFG Repo-Cleaner' are resources that assist in removing unwanted files from a repository's history. When an unwanted file is in a remote repository, the local repository needs to be 'cleaned up' (unwanted files removed) and left in a valid and acceptable state (with git filter-branch or BFG commands). Then a force-push is required to overwrite the remote repository, as well as the pushed up branches. Finally, admins of the remote repository need to remove cached views and references to sensitive data in pull requests, and collaborators need to rebase (not merge) any branches created off the old (tainted) repository history.

5. Which commands would you use? Explain what the command does.
  $ bfg --delete-files <file.txt> # Remove file with sensitive data and leave last commit untouched
  $ bfg --replace-text file.txt # Replaces all text listed in 'file.txt' wherever it can be found in the repository's hstory

Reference: https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
