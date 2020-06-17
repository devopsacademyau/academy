
# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise
```

git branch bugFix

git checkout bugFix

git commit -m "bugFix commit"

git checkout master

git commit -m "Master commit"

git merge bugFix
```

2. Commands typed to solve the "Rebasing" exercise
```

git checkout -b bugFix

git commit -m "commit to bugFix"

git checkout master

git commit -m "Master commit"

git checkout bugFix

git rebase master
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

