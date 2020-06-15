# c01-git04


1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
```
The colleague is worried about getting the sensitive information exposed. So, ideally you should change the password or clean the repo as anybody who has cloned your repo will have a copy of the sensitive information.
```

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
```
No, even if the file is modified and pushed to erase the information from git, it would not remove the same from your remote repository.The data is retained in the history.Someone can get the particular commit and access the file. 
```
3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
```
No, the data can still be accessed from the history even if you remove it from a new commit.
```
4. How to fix this? How do you remove something from Git history when it is in the remote repository?
```
If you commit sensitive data, such as a password or SSH key into a Git repository, you can remove it from the history. To entirely remove unwanted files from a repository's history you can use either the git filter-branch command or the BFG Repo-Cleaner open source tool.
```
5. Which commands would you use? Explain what the command does.
```
BFG-Replo Cleaner commands:
To remove the file with sensitive data and leave your latest commit untouched use:
 bfg --delete-files myenv.txt[YOUR-FILE-WITH-SENSITIVE-DATA]

To replace all text listed in passwords.txt wherever it can be found in your repository's history, run:
$ bfg --replace-text passwords.txt
```
```
#Filter-branch commands:
To Force Git to process, but not check out, the entire history of every branch and tag;Remove the specified file, as well as any empty commits generated as a result
and Overwrite your existing tags:
 git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch ../../myenv.txt[PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA]" \
  --prune-empty --tag-name-filter cat -- --all

#To ensure you dont commit sensitive data again, put it in .gitignore file
echo "myenv.txt[YOUR-FILE-WITH-SENSITIVE-DATA]" >> .gitignore   

#Finally, to force-push your changes to overwrite github repo and tags:
git push origin --force --all
git push origin --force --tags

#Contact GitHub Support or GitHub Premium Support, asking them to remove cached views and references to the sensitive data in pull requests on GitHub
#.Tell your collaborators to rebase branches created of your old repo.

#Force all objects in your local repository to be dereferenced and garbage collected with the following commands:
git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
$ git reflog expire --expire=now --all
$ git gc --prune=now

```
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
