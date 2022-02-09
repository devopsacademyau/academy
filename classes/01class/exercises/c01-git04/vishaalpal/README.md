# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
The "my_env.txt" file contains sensitive data (username/password). If this file is not on the git ignore list on the remote repository, anyone will be able to view this sensitive information in plaintext. 

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
No it will not be enough. Reason being is that you are unable to remove this sensitive data from clones or forks othat users may have of your repository. The sensitive information may still be available in past pull requests or via their SHA-1 hash in cached views on GitHub. 

Source: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
Assuming the file has already been committed and pushed to the remote repository, this won't be enough. 
Reason being is that you are unable to modify any repositories that have been cloned from the remote repository as well as the sensitive data being in Git History via their SHA-1 hash in cached views on GitHub. Similarly to the above scenario.   

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
In order to fix this issue, I would utilise the git filter-repo tool to remove the sensitive data from the repository as explained in the article here: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

5. Which commands would you use? Explain what the command does.
# Clone a local copy of your repository
> git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
This command allows you to clone a local copy of your repository to start working on the fix.

# View Git History 
> git log 
This command allows you to view Git History/Log. Find the hash reference of the original commit of "my_env.txt" which contains sensitive information. 

# Purging "my_env.txt" from the repository history and deletes the file
> git filter-repo --invert-paths --path my_env.txt --force
This command will remove the file "my_env.txt" as well as any empty commits generated as a result. 

# View Git History to ensure the selected commit has been removed
> git log
Use this command again to verify that commits related to the "my_env.txt" file have been removed. 

# Re-create the "my_env.txt" file and add the necessary information
> touch my_env.txt 
> nano my_env.txt
The first command creates the text file. The second command allows you to edit the text file in the nano text editor. 

# Add the "my_env.txt" file to your .gitignore file
> touch .gitignore
> echo "my_env.txt" >> .gitignore
The first command creates the .gitignore file. 
The second command tells git to ignore the "my_env.txt" file (and any other files in the .gitignore list) when you push your changes to the remote repository. 

# Add the my_env.txt file to get ready for staging/committing
> git add .gitignore
> git add my_env.txt
This command adds a change in the working directory to the staging area. It tells Git that you wish to include updates to this particular file(s).

# Stage and commit your changes
> git commit -m "Updated my_env.txt file"
This command stages and commits your changes in the local repository and adds it to Git History with a unique SHA-1 hash. 

# Force push changes on your local repository to the remote repository on GitHub
> git push origin --force --all
This command forces a push to your remote repository overwriting it with the contents of your local repository. A force push is required in order to remove sensitive data from your commit history. 

# Force push changes against your git tags
> git push origin --force --tags
If you have created any tagged releases, this command will be necessary in order to remove any sensitive files from them. 

Lastly, any collaborators developers should be advised to rebase, NOT merge, their local repositories with the latest changes. 
Performaing a git merge will push the sensitive information from collaborators local repository again to the remote repository effectively counteracting the work you have just done. 

Source: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)

