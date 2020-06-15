# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
The .env file is used to set the environment variable and it may have sensitive information like Access key tokens, DB passwords etc. When the repo is cloned by other users, there is a risk that these sensitive information is visible to others. 

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
Git maintains hostory of commits and hence even though the pasword or sensitive information is removed and pushed to remote, the info can still be retrieved from the history of commit.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
The answer is same as above. Git store history of commits, and hence the information can be retrieved fromm previous commits.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
The command to remove the sensitive information also from previous hostorical commit is by running below command -
"git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD" <-- Run this in Local repository
"git push origin --force --all" <-- Run this in Remote Master
For large repositories this may take time to scan the whole repository and remove the trace.

5. Which commands would you use? Explain what the command does.
The command in statement 4 can be used. The command that run in local repository will go through the previous commits and looking for the file and will remove the file from the unpushed history.
The command in Remote master will remove the files from the Remote Master as well. 

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
