# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?

No, you'd need to use `git reflog` to view inner commits from a squashed commit. 

The following article describes this in detail [link](https://robertbasic.com/blog/use-git-reflog-to-split-two-squashed-commits/).

After squashing the commits using `git rebase` you've rewritten history, but these changes are maintained in the reflog.

```Reference logs, or "reflogs" are a mechanism Git uses to record updates applied to tips of branches and other commit references. Reflog allows you to go back to commits even though they are not referenced by any branch or tag. After rewriting history, the reflog contains information about the old state of branches and allows you to go back to that state if necessary. Every time your branch tip is updated for any reason (by switching branches, pulling in new changes, rewriting history or simply by adding new commits), a new entry will be added to the reflog.```

2. How to compare two different local branches using `git diff`? How about remote ones, can you do the same?

To compare local branches use `git diff branch1 branch2` where branch1 and branch2 are the two branches you want to compare.

If the branch is remote add `origin\` before the name of the branch to compare with the remote repository, for example: `git diff origin\branch1 origin\branch2`

***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/5e1ec235517f206c8d4a11a37388fcfd0220d194/classes/01class/exercises/c01-git02/README.md)
