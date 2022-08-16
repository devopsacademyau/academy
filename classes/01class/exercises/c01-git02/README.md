# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
No, you'll need to use `git reflog` to view inner commit from squashed commit. 

For more information, see this link for more details [Link](https://robertbasic.com/blog/use-git-reflog-to-split-two-squashed-commits/).
```

2. How to compare two different local branches using `git diff`? How about remote ones, can you do the same?
```
To compare the two local branches use `git diff branch-name-A branch-name-B`.

To compare the remote branches, add `origin` like `git diff origin/branch-name-A origin/branch-name-B`.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/5e1ec235517f206c8d4a11a37388fcfd0220d194/classes/01class/exercises/c01-git02/README.md)


inner commit
squashed commit
git rebase

view the inner commit from a squashed commit using rebase.