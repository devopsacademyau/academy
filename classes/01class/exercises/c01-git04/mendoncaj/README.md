# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> Worried that you might been sharing sensible data with others.


2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> No because git keeps tracking of everything through logs.


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

> No because git keeps tracking of everything through log. In additiong someone else could already have local copies.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

> Must delete file, rewrite some histories and ask the developers to rebase, not merge, any branches they created off of your old (tainted) repository history.

5. Which commands would you use? Explain what the command does.
   
git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch <<PATH_TO_FILE_TO_BE_REMOVED>>" \
--prune-empty --tag-name-filter cat -- --all

git push origin --force --all

* Force Git to process, but not check out, the entire history of every branch and tag
* Remove the specified file, as well as any empty commits generated as a result
* Overwrite your existing tags

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)