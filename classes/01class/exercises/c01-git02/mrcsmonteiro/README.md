# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
Rebase/Squash will hide context (inner commits), but the historical branch might be kept with the entire development history as a workaround. Alternatively, if the branch is rebased and the git history needs to be rewritten, 'git reflog' can do the trick and be used to show a log of changes to the local repositorie's HEAD.
```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
```
$ git diff <branch1> <branch2> # comparing two local repositories
$ git diff <origin/branch1> <origin/branch2> # comparing two remote repositories
```

***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
