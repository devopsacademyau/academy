# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
It is but the commits will be listed on a different branch and can not be used?
You can use `git reflog` to see the reference log of the whole git repo.
```

2. How to compare two different local branches using `git diff`? How about remote ones, can you do the same?

You would use the following commands
```
git diff branch1 branch2
```
This will give you a overview of the file changes.

An individual file
```
git diff branch1 branch2 -- file
```

You can also use.
```
git log branch1 branch2
```
This will show you the different commits.


***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/5e1ec235517f206c8d4a11a37388fcfd0220d194/classes/01class/exercises/c01-git02/README.md)
