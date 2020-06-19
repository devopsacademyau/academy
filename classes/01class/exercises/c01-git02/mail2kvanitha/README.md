# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
Yes, it is possible to see the inner commit of squashed commit with git rebase -i HEAD~n, where n is the number of commit before the current commit.
```


```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
Two different local repositories can be compared using git diff <local_repo_path1> <local_repo_path2>

The same can be dont between remote repository and local repo branch. The command for the same is
git diff <local_master> <origin/master>
```

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
