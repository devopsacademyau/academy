# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?  

About sensitive data being sent to the remote repository and being available for everybody with access to the repository.


2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?  

No, because the details will still be available in the history.


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?  

No, because Git is a content tracker, so will still be in the history all the changes, including deletion and creation of the file again. Is possible to track back the info checking the commit hashcodes and then using `git cat-file` command.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

First use `git rebase -i HEAD~2` to drop the commit of this file. Then, after removing the file, we also need to use the `git filter-branch` we used on the exercise 3 to remove the file from the history.


5. Which commands would you use? Explain what the command does.
   # Edit the last two commits and drop the commit of the file with sensitive data:

   `git rebase -i HEAD~2`

   # Use the git filter-branch to remove the file

   `git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch ./my_env.txt" --prune-empty --tag-name-filter cat -- --all`


   # Force all objects in your local repository to be dereferenced and garbage collected 

   `git reflog expire --expire=now --all`
   `git gc --prune=now`

   # Create again the file and add to .gitignore:
 
	`echo "./my_env.txt" >> .gitignore`
	`git add .gitignore`
	`git commit -m "Add my_env.txt to .gitignore"`

   # Force a new push to overwrite the remote 

   `git push origin --force --all`


   *source - https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository*


***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)