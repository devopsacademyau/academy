# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```

Yes, `git reflog` show all HEAD refs, including all squashed inner commits.
Think in git as a onion, everything you do creates an extra layer.

```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
```
You can compare with `git diff <branch1_path> <branch2_path>` it is possible for local and remote branches. For instance, to compare the differents in this exercise on local and remote branch use:
`git diff frdvo/c01-git02 origin/frdvo/c01-git02`

```


***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
