# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

They are worried because it contains sensitive information that could potentially be used by someone with ill intentions.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

It will still remain in the commit history.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

It will still remain in the commit history.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

We would need to clone the repo to local machine and use git filter-branch to remove the history that contains the sensitive information before pushing back up into the
remote repo.

5. Which commands would you use? Explain what the command does.
   
# clone repo to local machine
> git clone <repository>
# Force git to go through all history and remove occurrences of "my_env.txt". Empty commits will be removed as well. 
> git filter-branch --force --index-filter "git rm --cached --ignore-unmatch p\a\t\h\my_env.txt" --prune-empty --tag-name-filter cat -- --all
# Create a git ignore file and add "my_env.txt" to it
> touch .gitignore
> echo "my_env.txt" >> .gitignore
# Push back to remote using --force
# --force disables the checks that are done when usually pushing back into a remote branch.
> git push --force


***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)