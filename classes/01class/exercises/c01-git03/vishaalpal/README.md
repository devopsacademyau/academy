# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
Originally the repository was 108KB. After the addition of the big file, the repository size changed to 20MB. 

2. What is the reason for this problem?
Git stores a history of previous commits. Therefore, when we add the "fairly big file" it still exists within the commit history.  

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
In order to remove a commit from Git history, I used the following commands:
# View Git History to review the commits
> git log 

# Revert the previous commit on the master branch
> git revert master

# Purging "file.txt" from the repository history
> git filter-repo --invert-paths --path file.txt --force

# View Git History to ensure the selected commit has been removed
> git log 

# Force push changes on your local repository to the remote repository on GitHub
> git push origin --force --all

4. What are the consequences of the previous action?
Performing the above commands in sequence deleted the latest commit where I added "file.txt" from Git History as well as the file itself from the repository. 

However the size of the repository after using git filter-repo changed from 20MB to 128KB, not the original size of 108KB, unsure as to why.

One caveat of using this method that I experienced is adding multiple commits with different files as it does not remove the commit from Git History but rather the file itself from the repository. This can become a challenge in a large repository where a single commit can contain additions of multiple files. 

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)

