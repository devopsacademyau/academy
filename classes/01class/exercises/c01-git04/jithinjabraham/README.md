# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about? The colleague is worried as this file contains sensitive information that are stored in cleartext. It is not safe or good practice to store secrets on git repos.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why? This will not fix the issue as the file can be retrieved via the commit history.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
Same answer as the previous question -  there will be versions of the file stored in the commit history of the repo.

4. How to fix this? How do you remove something from Git history when it is in the remote repository? This can be fixed via the git filter-repo command which was learnt in c01-git03. 


5. Which commands would you use? Explain what the command does. Similar to the answer in the previous exercise, the commands that could be used are:

git filter-repo --invert-paths --path file-path 
The git filter-repo command does path based filtering. 
In this case, we are attempting to keep all the files except for file(s) we wish to delete. The '--invert-path' tag helps us achieve that. Instead of listing all the directories we want to keep, we can list all the directories/files we would like to remove.
Running this command will filter out all the commits related to the files, essentially rewriting git history!

After the above command, the changes are to pushed to the remote branches with the below command.
git push origin --force --all

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)