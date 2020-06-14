# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, before added the big file (100M) repo size was 168k and after added was 201M.

2. What is the reason for this problem?

A file copy was stored on the folder /.git/objects as history.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

Git history will need to be rewrited.
git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD 
git push -all

4. What are the consequences of the previous action?

The file will not be able to recovered also the rewritten history will have different object names for all objects and will not join with the original branch. It will not sbe able to easily send and distribute the rewritten branch at the top of the original branch.


***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)