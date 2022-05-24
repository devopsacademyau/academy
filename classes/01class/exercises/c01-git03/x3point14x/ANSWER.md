# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
```
Yes, after I initialised the repo, added and commited the readme file the repo folder was 100K. 
After I created the large file, added and commited the repo was 20M.
```
2. What is the reason for this problem?
```
Git keeps track of commit history, even though the file is compressed each time the file is changed it will increase the size of the repo. Even if the file is deleted it will still exist in the history
```

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
```
There are many potential approaches to this problem, for my case I'm going to assume there is nobody else that has pulled and is currently working on the remote branch for the sake of simplicity.

# Back up the branch somewhere else locally
> cp [path_to_local_repo] [path_where_repo_backup_is_stored]

# Use the filter repo command (https://github.com/newren/git-filter-repo)
> git filter-repo --path ./file.txt --invert-paths
> git push -f [origin] [remote]

# Maybe add the file to .gitignore? or remove it locally?

# push changes to remote repo
> git push origin --force --all
```
4. What are the consequences of the previous action?

```
Removing a file from a remote repo's history should only be done after merging or closing all open pull requests, as the commit hashes will change and any changes not added to the repo will not be completed.
Anyone with a local copy of the repo would need to pull the changes from the remote repo before continuing their work.
```
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)