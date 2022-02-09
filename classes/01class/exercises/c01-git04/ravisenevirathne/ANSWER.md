# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

Content on the my_env.txt file contain clear text password. These details are visible to anyone who got access to this repo



2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

It will not erase the password from remote repo. Password is still visible under previous commits


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

Still not enough as the previous version of the file still available under previous commits.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

Need to remove this file from previous commit history and then new changes can push to remote repo


5. Which commands would you use? Explain what the command does.

- "git filter-repo --invert-paths —path my_env.txt" command go through every branch and removed the specified file
- Add it .gitignore to exclude from future commits
- "git push origin —force -all" Pushes all changes to remote repo
   
Ref - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
