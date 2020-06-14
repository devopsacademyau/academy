# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
Yes, using `git reflog`. Just to show one example, I made a test making 3 commits and then rebasing `HEAD~2`. The results I have got were:

`
5daa9b6 (HEAD -> master) HEAD@{0}: rebase -i (finish): returning to refs/heads/master
5daa9b6 (HEAD -> master) HEAD@{1}: rebase -i (squash): First commit
b4c12f3 HEAD@{2}: rebase -i (start): checkout HEAD~2
8a172a1 HEAD@{3}: commit: Second commit
b4c12f3 HEAD@{4}: commit: First commit
55b0869 HEAD@{5}: commit (initial): Initial

`


```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
```
git diff branch1 branch2

Yes, following the same pattern above and using the correct paths for local and remote branches - E.g.:

`git diff rodrigovcesar/c01-git02 upstream/master`

```

***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
