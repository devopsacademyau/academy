# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
```
This file contains the password. Password is sensitive and shouldn't be stored as plain text
```

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
```
No, anyone can use the 'git log' command to checkout the file using the initial commit to see the password 
```

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
```
No you can still use the 'git log' command and  checkout the file using initial commit to see the password 
```

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

```
We need to use either git rebase or git filter-repo command
```

5. Which commands would you use? Explain what the command does.
```
I will use git rebase command as we need to remove only text from the file and not the entire file.

Use  git rebase -i commit#

Use squash merge commits in the editor (this way the initial commit id of the password can be rewritten)

Use git push with force option to push the changes to remote
git push --force 

 ```  

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)