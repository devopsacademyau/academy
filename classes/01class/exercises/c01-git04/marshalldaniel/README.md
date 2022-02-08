# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
That the information relates to credentials being used elsewhere and that anyone with access to the file also has access to whatever the credentials do as well.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
It won't as the file will still be accessible in the git history and in the remote repository. Consequently, all other pulls with this file will still have it in their local respository as well.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
Again, file is still in the history, remote respository, as well as potentially other local repos.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
Using "git filter-repo --invert-paths --path my_env.txt" will remove the file from history, as well as any empty commits which have this file included. This means the single commit which added this file as well as the revert commit which removed the previous commit will be wiped from the local git history.

After removing the file and any empty commits from the local repo, the file can be added to .gitignore so it is not accidentally commited once more. This can be done with:
echo "my_env.txt" >> .gitignore
git add .gitignore
git commit -m "Add file.txt to .gitignore"

Command "git push origin --force --all" will force push the made changes to the origin of the repo.

5. Which commands would you use? Explain what the command does.
Step 1:
git filter-repo --invert-paths --path my_env.txt

filter-repo - Rewrites repo history with specified filters. This is destructive as it creates new commits and deletes the existing ones.
invert-paths - Selects the inverse of the specified path attribute.
path - The path to the file in the repo.

Step 2:
echo "my_env.txt" >> .gitignore
git add .gitignore
git commit -m "Add file.txt to .gitignore"

echo "my_env.txt" - Generates the string "my_env.txt".
>> .gitignore - Appends the preceding output to .gitignore.
add .gitignore - Adds the .gitignore file to the git repo.
commit -m "Add file.txt to .gitignore" - Creates a commit with the message "Add file.txt to .gitignore".

Step 3:
git push origin --force --all

push origin - Updates the remote repo with the changes made in the local repo.
force - Causes the push to disregard checks for the local repo having the most up to date branch.
all - Specifies all branches.

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
