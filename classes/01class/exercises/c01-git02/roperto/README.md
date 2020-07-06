# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
Short answer is "no", but I can probably help you to find your beloved lost commit.

(the answer below applies to your local repository not if you pulled it squashed already)

Scroll up your terminal and try to find the "sha" for the commit you want to see again,
there is a big chance you will find a reference there.

If you cannot find it, there is still hope to find the dangling commits with a tool such as 'git fsck'.
```

2. How to compare two different local branches using `git diff`? How about remote ones, can you do the same?
```
# To check what is different in the current branch since "master"
git diff master

# To check two arbitrary branches (ie: what is new in "staging" since "master")
git diff master..staging

# For remote ones is the same syntax, just make sure you have it updated locally:
git remote update

# Now use the branch in remotes/[remote]/[brach] as a referemce, ie:
git diff remotes/origin/master..remotes/origin/staging
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/5e1ec235517f206c8d4a11a37388fcfd0220d194/classes/01class/exercises/c01-git02/README.md)
