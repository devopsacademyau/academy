# c01-git03


1. Did you notice any difference in the size of the repo before and after adding the big file?
> Yes, before adding, the big file the size was 109K however after commit the size was increased to 20M and then after `git revert HEAD` the size remains within 10M. 

2. What is the reason for this problem?
> The situation occurs because git stores references needed to restore the file such as a backup in case of delete by error. Git history can be tracked within .git/objects and within repo.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
> git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD

4. What are the consequences of the previous action?
> Changes can not be undone and as such, not recommended.
git filter-repo is preferred as it has better performance and scales more efficiently.

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
