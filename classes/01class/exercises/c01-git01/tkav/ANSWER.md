# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise
```
git checkout -b bugFix
git commit -m "Fixed Bug"
git checkout main
git commit -m "Change on main"
git merge bugFix
```

2. Commands typed to solve the "Rebasing" exercise
```
git checkout -b bugFix
git commit -m "Fixed bug"
git checkout main
git commit -m "Updated main"
git checkout bugFix
git rebase main
```

3. Commands typed to solve the "Revert and reset" exercise
```
git reset HEAD~1
git checkout pushed
git revert HEAD
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git01](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git01/README.md)
