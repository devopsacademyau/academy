# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
```
Yes. Before creating the big file the repo had 40k. After that, the repo had 201M. 
```

2. What is the reason for this problem?
```
Even if you deleted the file, the git still has kept the file within git folder (/.git/objects)
```

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
```
As of 2.22 version the git has launched filter-repo command which is a more performative command for rewriting history.
git filter-repo --path [file] --invert-paths
git push -f [origin] [remote]
```

4. What are the consequences of the previous action?
```
It will remove the file from both local and remote repository permanently and there is no chance of restoring the deleted file.
```

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)