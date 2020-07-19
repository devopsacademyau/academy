# Exercise 1

> git checkout -b bugFix
> git commit -m "First Commit"
> git checkout master
> git commit -m "Second Commit"
> git merge bugFix

# Exercise 2

> git checkout -b bugFix
> git commit -m "First Commit"
> git checkout master
> git commit -m "Second Commit"
> git checkout bugFix
> git rebase master

# Exercise 3

> git reset HEAD~1
> git checkout pushed
> git revert HEAD