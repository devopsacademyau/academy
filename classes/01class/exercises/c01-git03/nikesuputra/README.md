# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, I did notice that the size of my local repository became almost twice the size of the big file.

2. What is the reason for this problem?

After some research and the help from this article [here](https://www.ducea.com/2012/02/07/howto-completely-remove-a-file-from-git-history/), I found out that the big file is also stored in git history in this path: `.git/objects/pack`

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

After some trials and error and the help from this article [here](https://fedingo.com/git-remove-file-from-history/) and [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository#fully-removing-the-data-from-github), I found out the commands to answer this question:
```
# Remove the file using this command
$ git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch <path_to_file>' HEAD

# Push the changes to remote branches with this command
$ git push origin --force --all

# Force all objects in local repository to be dereferenced and garbage collected with the following commands
$ git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
$ git reflog expire --expire=now --all
$ git gc --prune=now
```
4. What are the consequences of the previous action?

It may cause disruption to other developers when they are working using the same repository before the file is removed from Git history, and that would forced them to manually fix their history as well.

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
