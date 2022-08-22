# c01-git01

## Commands executed

1. Commands typed to solve the "Merging" exercise

# First ensure you are on the master branch
git checkout master
# create new branch called bugFix and commit once
git checkout -b bugFix
git commit -m "first commit"
# changing back to master branch and commit one more time
git checkout master
git commit -m "second commit"
<merge bugFix branch with master branch>
git merge bugFix



2. Commands typed to solve the "Rebasing" exercise

# First ensure you are on the master branch
git checkout master
# create new branch called bugFix and commit once
git checkout -b bugFix
git commit -m "first commit"
# go back to master branch and commit one more time
git checkout master
git commit
# rebase bugFix branch with master branch. Before doing rebase, swtich to bugFix branch
git checkout bugFix
git rebase master



3. Commands typed to solve the "Revert and reset" exercise


git reset HEAD~1
git checkout pushed
git revert HEAD 

Above answers are for https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git01/README.md