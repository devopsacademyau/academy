# c01-git03

1. Did you notice any difference in the size of the repo before and after adding the big file?
```
Yes after adding the 10 MB file the size of directory became  20 MB
```

2. What is the reason for this problem?
 When a new file is added a copy is maintained by git inside .git folder


3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

```
Using git filter-repo command
 
 git filter-repo --force  --path file.txt --invert-paths
 
```
4. What are the consequences of the previous action?
```
We need to be careful with git filter-repo as it  does irreversible rewriting of history.We shouldnot use this if we dont have good backup
```

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)