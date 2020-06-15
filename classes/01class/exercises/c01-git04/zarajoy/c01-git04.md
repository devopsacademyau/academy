printf '%s\n' 'SERVICE_NAME=account-management' 'ENVIRONMENT=prod' 'PASSWORD=pass1234' >my_env.txt
git add my_env.txt
git commit -m "add my_env details"
git log
commit 18bcdf5ce1d8615ab058b78e2c2cf343fd8f5298 (HEAD -> master)
Author: Zara Joy Langston-McRink <zarajoy@outlook.com>
Date:   Mon Jun 15 13:02:33 2020 +1000

    add my_env details
    
    
1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

This information could be gained by people with access to the remote repo. It is not recommended to keep such sensitve info in plain text!!


2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No. It will still exist in log of past  commits.


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No. This is just adding a new commit into the history. The old commit is still present in log.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?
there are a few options;
With great difficulty. Removing history that haas been pusblished to a remote and possibly public repo is not an easy task.
git filter-branch
git filter-repo (https://github.com/newren/git-filter-repo) 
BFG Repo-Cleaner (https://rtyley.github.io/bfg-repo-cleaner/)
use one of the above commands and then push to the remote.


5. Which commands would you use? Explain what the command does.
git filter-branch --tree-filter 'rm -f my_env.txt' --prune-empty -- --all
In git (git), Rewrite revision history (filter-branch) and rewrite the index (--index-filter). Remove file from working directory (RM), remove file from staging area (--cached), exit gracefully if the file does not exist (--ignore-unmatch). The file (-f) we are talking about is is (my_env.txt). Remove any commits that will be empty after this action (--prune-empty). Do this for all branches (--all)

git push origin -f --all
in git (git) push (push) your commited changes to the remote repo(origin). Force (f) this, even if the remote repo loses commits. push to all branches (--all)

   

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
