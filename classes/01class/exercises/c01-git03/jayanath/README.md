# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
```
Yes. The repository size increased from 100K to 20M. 
```

2. What is the reason for this problem?
```
Git keeps every version of each and every file and that design does not work well with large files.
It significantly increases the size of the repository with each new version.
```

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
```
git filter-branch --tree-filter 'rm -rf path/to/the/bigfile' HEAD
git push

```

4. What are the consequences of the previous action?
```
"git filter-branch has a plethora of pitfalls that can produce non-obvious manglings" 
- source: git documentation [https://git-scm.com/docs/git-filter-branch]

I tried to use git-filter-repo instead [https://github.com/newren/git-filter-repo/]
I could remove a file by using the command git filter-repo --invert-paths --path filename
It worked as advertised, but wiped out the reflog :-( as well. 

```

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)