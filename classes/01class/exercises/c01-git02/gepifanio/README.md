# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
Yes it is, using the command `git reflog`.

```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
```
Local repo:

You need to just type in 

git diff `branch1` `branch2` it will show you the diff.

Remote repo:

You need to add the remove using

git remote add alias repo_url

and after you just add the command

git diff branch1 alias/branch2

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
