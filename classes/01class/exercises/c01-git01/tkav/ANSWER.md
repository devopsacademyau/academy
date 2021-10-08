# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise
```
# Ensure creating branch from main by switching to it first
git checkout main

# Create a new branch and switch to it
git checkout -b bugFix

# Make changes and commit
git commit -m "Fixed Bug"

# Switch back to main branch
git checkout main

# Make changes on main branch and commit
git commit -m "Change on main"

# Merge changes from bugFix branch
git merge bugFix
```

2. Commands typed to solve the "Rebasing" exercise
```
# Switch to feature branch
git checkout -b bugFix

# Make changes on feature branch and commit
git commit -m "Fixed bug"

# Switch to main branch
git checkout main

# Make changes on main branch and commit
git commit -m "Updated main"

# Switch to feature branch
git checkout bugFix

# Rebase main, pulling latest changes from main branch to feature branch
git rebase main
```

3. Commands typed to solve the "Revert and reset" exercise
```
# (Exercise starts on local branch ahead of main) 
# Revert commit on local branch
git reset HEAD~1

# Switch to remote branch named 'pushed'
git checkout pushed

# Revert changes on remote branch named 'pushed'
git revert HEAD
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git01](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git01/README.md)
