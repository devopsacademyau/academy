# c01-git03


1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, there was a difference in the sizes of the repository. While, before adding the big file the size was 164k, after addition of file size got increased to around 200 M. 

2. What is the reason for this problem?

The reason for this size increase is that git tends to cache data in its .git folder as well.This allows us to retrieve our files quickly.


3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

Pushing a commit which removes files will not make the git history smaller.Those files need to removed from the history in order to shrink the size. This could be done with a combination of commands :

git filter-branch 
git gc --aggressive --prune=now

To remove large files, we can use a BFG Repo-Cleaner:
java -jar bfg.jar --strip-blobs-bigger-than 100M some-big-repo.git

4. What are the consequences of the previous action?

The commit hashes will be changed and the repository's history will be rewritten.  This can have an effect on any super repos or any open pull requests.

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
