# c01-git02

## Answers

### 1. Is it possible to see the inner commit of squashed commit with `git rebase`?
Yes, using:

```
git reflog
```
For instance getting this output:

```
46f3319 HEAD@{0}: rebase -i (finish): returning to refs/heads/master
46f3319 HEAD@{1}: rebase -i (squash): Squashed commit with Add ANSWER2.md again
abc6d70 HEAD@{2}: rebase -i (squash): # This is a combination of 9 commits.
fbf04aa HEAD@{3}: rebase -i (squash): # This is a combination of 8 commits.
63bd91c HEAD@{4}: rebase -i (squash): # This is a combination of 7 commits.
384a7ad HEAD@{5}: rebase -i (squash): # This is a combination of 6 commits.
dfb9768 HEAD@{6}: rebase -i (squash): # This is a combination of 5 commits.
c920c22 HEAD@{7}: rebase -i (squash): # This is a combination of 4 commits.
c2d5bb5 HEAD@{8}: rebase -i (squash): # This is a combination of 3 commits.
77e46ee HEAD@{9}: rebase -i (squash): # This is a combination of 2 commits.
643c725 HEAD@{10}: checkout: moving from master to 643c725
aec3935 HEAD@{11}: commit: latest one buddy
91f4663 HEAD@{12}: commit: add test readme
f773185 HEAD@{13}: commit: add test readme
```



### 2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?

#### To compare local repos

Say you have a local repo1 in:
```
/path1/repo1folder/
```

And another local repo2 in:
```
/path2/repo2folder/
```

To compare both move to one of the repo's folder and do a diff, in this way, say I am in repo1 folder:

```
cd /path1/repo1folder/
git --work-tree=/path2/repo2folder/ diff
```


#### Compare remote repos:

Using the `git remote` option.

Say there are two remote repos to compare:

```
carloshz4/repo1.git
carloshz4/repo2.git
```

Create a connection to the remote repo this way:
```
git remote add -f a git@github.com:carloshz4/repo1.git
git remote add -f b git@github.com:carloshz4/repo2.git
```

To see the link to these repos:
```
git remove -v
```
Make sure they are up to date:
```
git remote update
```
Now compare both:
```
git diff remotes/a/master remotes/b/master
```

Once compared, the link can be removed:
```
git remote rm a
git remote rm b
```

### (Optional) Install ohmyzsh and activate the git plugin

Thanks for suggesting this tool, pretty cool :)


***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)

