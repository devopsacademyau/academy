# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?

```
Yes, first find the hash commit[s]:

$ git reflog <branch>

note.: If the branch no longer exists, try: $ git reflog show 

then if you need more details inspect the commit with

$ git log -p bd8db00
```

2. How to compare two different local branches using `git diff`? How about remote ones, can you do the same?

```
Yes, git diff does work with either local or remote branches:
$ git diff <remote>/<remote branch> <local branch>
```


***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/5e1ec235517f206c8d4a11a37388fcfd0220d194/classes/01class/exercises/c01-git02/README.md)