# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Commit README.md, repo @ 180KB

Create bigfile.txt, repo @ 101M

Add bigfile.txt, repo @ 201M

Commit bigfile.txt, repo @ 201M



2. What is the reason for this problem?

Due to the commit tracking the change history, the file will be tracked in the git history and thus, not only adds the initial file size, but doubles it since it's also tracked in history

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

`git reset --hard HEAD^` repo @ 101M - bigfile.txt no longer in directory

or

`git revert HEAD` repo @ 101M - bigfile.txt no longer in directory, log contains add bigfile and revert add bigfile logs

4. What are the consequences of the previous action?

# RESET HARD

You will lose any changes made since the commit the branch was reset to. This includes, all uncommitted changes and the bigfile.txt
In the case that someone had pulled or fetched the repo prior to the reset, they can still see the file in their local copy. Additionally you will lose all uncommitted changes.

# RESET SOFT

Reset soft will remove the commit but keep anything done before the commit, ie. added files.

# REVERT

bigfile.txt is no longer in directory but the git history will contain both the commit and the revert for bigfile.txt meaning if you check the logs, you can still find bigfile.txt's contents

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
