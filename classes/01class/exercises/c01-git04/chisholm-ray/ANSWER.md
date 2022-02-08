# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

it has password in clear text

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

no, you could still look up the file in the previous commits and see the changes

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

again no because you can still see the changes made through the commit history

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
You need to completely remove the file from all history in your local repository and any references to it then push those changes to the remote repo

5. Which commands would you use? Explain what the command does.

Clone a copy of the repository so it is up to date and has no local history
```git clone```
install then use git filter-repo, specify the full path to the file. This command processes the entire history of every branch and tag and removes the specified file.
```git filter-repo --path path/to/my/file.txt```
add file to .gitignore so it doesn't get pushed again

then push all changes to the remote repo
```git push origin --force --all```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)