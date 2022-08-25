# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

It is worried about having sensible information with public access. 

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

The reference to the actual file is still in the commits, therefore, it still could be access through the logs. 

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

This action is not deleting git history, so commits are still available. 

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

First, rewriting the repository's history with 'git filter-repo' tool or the BFG Repo-Cleaner open source tool. 
Second, after the sensitive data is removed, you must force push your changes to GitHub. 
Third, contact admins asking them to remove cached views and references to the sensitive data in pull requests on GitHub. 
Finally, tell your collaborators to rebase, not merge, any branches they created off of your old (tainted) repository history.
Source: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

5. Which commands would you use? Explain what the command does.

brew install git-filter-repo
Install the git filter-repo tool. 

git filter-repo --invert-paths --path academy/classes/01class/exercises/c01-git04/julio-pimentel/my_env.txt
Force Git to process, but not check out, the entire history of every branch and tag
Remove the specified file, as well as any empty commits generated as a result
Remove some configurations, such as the remote URL, stored in the .git/config file.




<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)