# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
```
They are worried that the secrets are now no longer secret. They are visible to anybody with access to the repo. If this repo is made public then anybody in the world now has access to yur so called "secrets".
```
2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
```
No, anybody can still go through the git history to find previous versions of the file and find the secrets

```

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
```
Again no, anybody can still go through the git history and find the previous versions of the removed file

```

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
```
This can be a painful process, but you could try a few alternate methods. It's important that there are no open PRs and that nobody is working on a local copy of the remote repo for both of my suggestions.

# Using git filter-repo: https://github.com/newren/git-filter-repo
# Using the BFG repo cleaner: https://rtyley.github.io/bfg-repo-cleaner/

Either way the sensitive data in the repo should be considered compromised and should be changed as soon as possible, especially if it is a public repo. If anybody has created braches of your tainted history a merge commit may re-introduce the secrets to your history.

```

5. Which commands would you use? Explain what the command does.

```
# Make a backup of repo before modifying it in case you need it
> cd [location_for_backup]
> git clone [remote_repo]

# Clone repo locally
> cd [desired_working_directory]
> git clone [remote_repo] && cd [repo_name]

# Remove the secrets file with git filter-repo tool
> git filter-repo --invert-paths --path [file_with_sensitive_data]

# Force push local changes to remote repo
> git push origin --force --all

# If using tagged releases, you may need to force-push against your git tags
> git push origin --force --tags

```
   
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)