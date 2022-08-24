# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

```
Originally file was 112K
After big file added it was 20M
After git revert HEAD, it was 10M
```

2. What is the reason for this problem?

Git keeps a copy of the files in history at commits. This could be used in cases where it is required to go back to a previous commit where the file still exists.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

You could use something like git filter-repo tool or the BFG Repo-Cleaner open source tool.

With the BFG Repo tool do the following.
```
bfg --delete-files file.txt my-repo.git
git push --force
```
or with filter-repo.
```
git filter-repo --invert-paths --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA
git push --force
```
Reference - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

4. What are the consequences of the previous action?

This can make it confusing to other people collaborating with the repository. When they try to merge, it may complain about the missing files that you deleted. The history is now also technically not accurate.

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
