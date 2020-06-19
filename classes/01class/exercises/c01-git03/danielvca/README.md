
# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, the repo got 4x bigger.

2. What is the reason for this problem?

A copy of the newly added file was place into the .git folder. This is for history and caching purposes. 

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

The command "git filter-branch" can be used to achieve this.

    git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD

([https://myopswork.com/how-remove-files-completely-from-git-repository-history-47ed3e0c4c35](https://myopswork.com/how-remove-files-completely-from-git-repository-history-47ed3e0c4c35))

4. What are the consequences of the previous action?

There`s no going back and this action should be avoided.
It will wipe the repo's history.
Other users will need to re-clone the repo.


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)

> Written with [StackEdit](https://stackedit.io/).

