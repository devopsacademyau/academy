# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?

```
The easiest way to see the inner commit of squashed commit is with "git reflog branchname" for the previous position of the beanch which is rebased. 
Find the SHA1 of the tip of the tip of the branch, just before the interactive rebase. 
With SHA1, we can use "git log -p" or "gitk" to view the commits and see the diffs. 
This is possible even after "git gc". Commit are reachable if they are reachable from anything in the reflogs and reflogs take 90 days to expire.

```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?

```
 Two different local repositories can be compared using git diff <local_repo_path1> <local_repo_path2>

 The same can be dont between remote repository and local repo branch. The command for the same is
     git diff <local_master> <origin/master>
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
