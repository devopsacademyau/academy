# c01-git03


1. Did you notice any difference in the size of the repo before and after adding the big file?

> Yes, before adding, the big file the size was 100K however after commit the size was increased to 20M and then after `git revert HEAD` the size remains within 10M. 

2. What is the reason for this problem?

> The situation occurs because git stores references needed to restore the file such as a backup in case of mis deleting.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

> git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch file.txt" \
--prune-empty --tag-name-filter cat -- --all

git push origin --force --all

**It does:**

* Force Git to process, but not check out, the entire history of every branch and tag
* Remove the specified file, as well as any empty commits generated as a result
* Overwrite your existing tags

4. What are the consequences of the previous action?

**After the previous action, you should:**

* Contact GitHub Support or GitHub Premium Support, asking them to remove cached views and references to the sensitive data in pull requests on GitHub.

* Tell your collaborators to rebase, not merge, any branches they created off of your old (tainted) repository history. One merge commit could reintroduce some or all of the tainted history that you just went to the trouble of purging.

* Taking in consideration that the files cannot be recovered, so if it is important, do a backup before any changes.

Ref:. https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
