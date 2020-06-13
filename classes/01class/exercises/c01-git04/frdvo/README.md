# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

    **It is exposing the credentials / passwords.**

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

**No, because git keep a copy on history.**

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

   ** No, the file will be on git history.**


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

    **First of all you have to change the leaked data, then work to remove it from the history.**
   **To remove data from Git history you may use the open source tool BFG Repo-Cleaner or git filter-branch**



5. Which commands would you use? Explain what the command does.

    `$ git filter-branch --force --index-filter \`
    `git rm --cached --ignore-unmatch "PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA" \`
    `--prune-empty --tag-name-filter cat -- --all`

    **The command above force Git to process, but not check out, the entire history of every branch and tag. It also remove the specified file, as well as any empty commits generated as a result. and finnaly, it overwrite your existing tags**

    `$ echo my_env.txt >> .gitignore`
    `$ git add .gitignore`
    `$ git commit -m my_env.txt to .gitignore"`

    **The command above add the file with password to .gitignore, avoiding to commit this file again.**

    `git push origin --force --all` 

    **The command above will force-push your local changes to overwrite your GitHub repository**

    `git push origin --force --tags`

    **The command above will force-push against your Git tags**








***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
