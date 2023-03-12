# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
 
Yes, from 85M to 95M
 
2. What is the reason for this problem?
 
Git stores a copy of the commit to this file. To keep records in the repo.
 
3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use?
 
git rebase -i HEAD~2
being 2 the number of previous commits you want to get
 
4. What are the consequences of the previous action?
 
You lose traceability of the commits and could not be a best practice for highly regulated customers.

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)