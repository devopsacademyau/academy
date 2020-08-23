# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise
```
git checkout -b bugFix
git commit -m "First Commit"
git checkout master
git commit -m "Second Commit"
git merge bugFix
```

2. Commands typed to solve the "Rebasing" exercise
```
git checkout -b bugFix
git commit -m "First Commit"
git checkout master
git commit -m "Second Commit"
git checkout bugFix
git rebase master
```

3. Commands typed to solve the "Revert and reset" exercise
```
git reset HEAD~
git checkout pushed
git revert HEAD
```
