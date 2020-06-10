# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise
```
# level intro3
# 1. Make a new branch called bugFix
# 2. Checkout the bugFix branch with git checkout bugFix
$ git checkout -b bugFix

# 3. Commit once
$ git commit -m "do 1st commit on bugFix"

# 4. Go back to master with git checkout
$ git checkout master

# 5. Commit another time
$ git commit -m "do 1st commit on master"

# 6. Merge the branch bugFix into master with git merge
$ git merge bugFix
```

2. Commands typed to solve the "Rebasing" exercise
```
# level intro4
# 1. Checkout a new branch named bugFix
$ git checkout -b bugFix

# 2. Commit once
$ git commit -m "do 1st commit on bugFix"

# 3. Go back to master and commit again
$ git checkout master
$ git commit -m "do 1st commit on master"

# 4. Check out bugFix and rebase onto master
$ git checkout bugFix
$ git rebase master
```

3. Commands typed to solve the "Revert and reset" exercise
```
# level rampup4
# 1. Reverse the most recent commit on local branch
$ git reset HEAD~1

# 2. Reverse the most recent commit on pushed (remote) branch
$ git checkout pushed
$ git revert HEAD
```

***
Answer for exercise [c01-git01](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git01/README.md)
