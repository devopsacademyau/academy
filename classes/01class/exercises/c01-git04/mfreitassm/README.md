# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

The colleague must be worried about the confidential information contained in the file that can be seen by anyone with access to the repository.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No, it will not be. Because git history keeps a copy of the file.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No, it will not be. Because git will create a new version of the file, but it will keep the old version on the history.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

Git history will need to be rewrited with git filter-branch comand or the BFG Repo-Cleaner tool.

5. Which commands would you use? Explain what the command does.

The git filter-branch command and the BFG Repo-Cleaner will rewrite the repository history, which changes the SHAs of the existing commits that was  changed and any dependent commits. 

With BFG Repo-Cleaner to remove the file with confidential data without changing the most recent commit:
$ bfg --delete-files YOUR-FILE-WITH-SENSITIVE-DATA
To replace all the text listed in passwords.txt whenever it is found in the repository's history, run:
$ bfg --replace-text passwords.txt.

WIith the filter-branch
> Access the repository's working directory.
$ cd YOUR-REPOSITORY

> Run the command replacing PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA with the path of the file to be removed
•	Force Git to process, but not checkout, the complete history of each branch and tag.
•	Remove the specified file, as well as any empty commit generated as  result.
•	Overwrite existing tags.
$ git filter-branch --force --index-filter \
the "git rm --cached --ignore-unmatch PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA" \
--prune-empty --tag-name-filter cat - --all

>. Add the file with confidential data to the .gitignore to prevent accidental repetition of the commit.

 $ echo "YOUR-FILE-WITH-SENSITIVE-DATA" >> .gitignore
 $ git add .gitignore
 $ git commit -m "Add YOUR-FILE-WITH-SENSITIVE-DATA to .gitignore"

> Check that you have removed all desired content from the repository history and checked out all branches.
> When a satisfied state of the repository, push local changes to overwrite the GitHub repository and all branches present in the push:
 $ git push origin --force --all

>To remove the file with confidential data from the tagged versions, It will also need to push Git tags:
$ git push origin --force --tags

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)