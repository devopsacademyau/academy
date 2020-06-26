# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?

```
Yes, you could use git reflog to retrieve information about commits (and basically all the movements of the HEAD).

```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?

```
To compare two different local repositories you can use git diff id1 id2, where id is the hash value (at least the first 4 digits)
of the commits you are trying to compare.

To compare remote repositories, first you need to add a remote repository. To do that you execute: git remote add <name> <url>
After that, you can compare branches by adding the path to the remote repository in the third argument passed to the git command, i.e.
git diff feernandobraga/c01-git02 origin/master
In this example, origin/master refers to the repo's remote master branch.

```

---

Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
