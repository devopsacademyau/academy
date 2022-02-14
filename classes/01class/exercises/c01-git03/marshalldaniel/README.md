# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
Yes. Started as 108K, then created a file and it became 10M. After adding and commiting the file to the repo, the size became 20M.

2. What is the reason for this problem?
The file is created in the repo as well as in the git history. This creates two copies of it locally.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
Using "git filter-repo --invert-paths --path file.txt" will remove the file from history, as well as any empty commits which have this file included. This means the single commit which added this file as well as the revert commit which removed the previous commit will be wiped from the local git history.

After removing the file and any empty commits from the local repo, the file can be added to .gitignore so it is not accidentally commited once more. This can be done with:
echo "file.txt" >> .gitignore
git add .gitignore
git commit -m "Add file.txt to .gitignore"

Command "git push origin --force --all" will force push the made changes to the origin of the repo.

4. What are the consequences of the previous action?
Removing a file from a remote repo's history should only be done after merging or closing all open pull requests, as the SHAs will be changed and any changes not added to the repo will not be completed.

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
