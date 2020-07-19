# c01-git01

## Commands executed


1. Commands typed to solve the "Merging" exercise

```bash
# Make a new branch called bugFix and Checkout the bugFix branch
git checkout -b bugFix

# Commit once
git commit

# Go back to master with git checkout
git checkout master

# Commit another time
git commit

# Merge the branch bugFix into master with git merge
git merge bugFix

```


2. Commands typed to solve the "Rebasing" exercise

```bash
# Checkout a new branch named bugFix
git checkout -b bugFix

# Commit once
git commit

# Go back to master and commit again
git checkout master; git commit

# Check out bugFix again and rebase onto master
git checkout bugFix; git rebase master

```

3. Commands typed to solve the "Revert and reset" exercise

```bash
# To reverse the most recent commit on both local(local branch) and pushed(remote branch).
git reset HEAD~1
git checkout pushed; git revert HEAD
```


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c01-git01](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git01/README.md)
