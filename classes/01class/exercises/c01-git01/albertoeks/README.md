# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise

```
$ git checkout -b bugfix
$ git commit -m "Commit on bugfix branch"
$ git checkout master
$ git commit -m "Commit on master branch"
$ git merge bugfix

```

2. Commands typed to solve the "Rebasing" exercise

```
$ git checkout -b bugfix
$ git commit -m "Commit on bugfix branch"
$ git checkout master
$ git commit -m "Commit on master branch"
$ git checkout bugfix
$ git rebase master

```

3. Commands typed to solve the "Revert and reset" exercise

```
$ git reset HEAD~1
$ git checkout pushed
$ git revert HEAD

```