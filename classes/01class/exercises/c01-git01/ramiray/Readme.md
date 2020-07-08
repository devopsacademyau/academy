# c01-git01 - Below commands are used for this exercise . 

1. Merging Exercise:
```
git branch bugFix
git checkout bugFix
git commit
git checkout master
git commit
git merge bugFix

```

2. Rebasing Exercise:
```
git checkout -b <branch-name>
git commit
git checkout master
git commit
git checkout <branch_name>
git rebase master 

```

3.Revert and reset Exercise
```
git reset HEAD~1
git checkout pushed
git revert HEAD

```

