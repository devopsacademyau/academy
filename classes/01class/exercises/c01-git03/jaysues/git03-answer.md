# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
Yes. The repo after the change had increased significantly more than the 100mb that was added.

2. What is the reason for this problem?
This was due to a copy of the file being saves under the objects folder in .git.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
The command you can use is git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD 
Once this has been run you will then need to push again - git push origin --force --all and will need to get collaborators to rebase as per https://stackoverflow.com/questions/43762338/how-to-remove-file-from-git-history

This command does have a warning as to how long it can take in older repos with lots of commits. 

4. What are the consequences of the previous action?
This can cause some serious issues with your repo if you are not careful. There is a lengthy warning from https://git-scm.com/docs/git-filter-branch about the potential problems including different object names, issues pushinging and distributing branches and more. It is actually recommended to use a tool such as https://github.com/newren/git-filter-repo/ due to the risks involved.
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)