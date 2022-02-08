# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

You've stored secrets in the Git repo which is a major security concern. 

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No it will not, Git will maintain the previous version of the file in it's history. 

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

Again, Git will maintain the history of the file in the repo even if it is deleted. 

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

You can use tools such as `BFG Repo Cleaner` or `git filter-repo` to remove the file from previous commits

5. Which commands would you use? Explain what the command does.

First, ensure you have an updated copy of the repo on your local machine then use either of these tools and your working directory is the root of the repo.  

Using BFG Repo Cleaner:

- Delete all copies of the file using `bfg --delete-files my_env.txt`
- Push the changes forcibly back to the remote repo using `git push --force`

Using git filter-repo:

- To remove the file from all commits as well as any empty commits execute `git filter-repo --invert-paths --path ./my_env.txt`
- Push the changes forcibly back to the remote repo using `git push --force`

After using either of the above tools there are additional steps required to ensure the sensitive data is completely removed and these are documented [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository#fully-removing-the-data-from-github).

You should also consider adding the file to `.gitignore` to ensure it's not accidentally committed in future. 

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)