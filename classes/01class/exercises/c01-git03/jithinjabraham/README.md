# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
With only the README, the repo was 120K. Once the big file was added, it was 10M.
After committing the file, it was 20M. Once reverting the commit, it went back down to 10M.


2. What is the reason for this problem?
This could be due to git storing the file in the commit history. 

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
In order to remove a commit from Git history, I used the following commands:

# Revert latest commit
git revert main
# Remove file from repo history
git filter-repo --path file.txt --invert-paths 
# Push changes to remote
git push origin --force --all

4. What are the consequences of the previous action?
The consequences of deleting files and changes from repo history include being unable to restore those changes if needed. 



***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)