# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
According to this [article](https://stackoverflow.com/a/3594848), it's possible to do that via `git reflog`, although the commits which reachable from this way are commits in the last 90 days. 

```

2. How to compare two different local branches using `git diff`? How about remote ones, can you do the same?
```
We can use `git diff <branch1>..<branch2>` to compare the two local branches. The double dot notation used to compare the tips or the latest commits on both branches.
If we just want to check which files differ, not how the content differs, we can add `--name-only`.
If we wish to see the difference between the two branches in a specific file, we can add `-- <filename>`.

Yes, we can do the same with the remote one, like so: `git diff <remote>/<branch1>..<remote>/<branch2>`
```

***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/5e1ec235517f206c8d4a11a37388fcfd0220d194/classes/01class/exercises/c01-git02/README.md)
