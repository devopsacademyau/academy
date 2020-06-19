# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes:
- Total repo size before adding/committing big file = 113M.
- Total repo size after adding/committing big file = 225M.

2. What is the reason for this problem?

- A repository is a collection of objects identified by their own hash. Staged files are stored into <repo>/.git/objects/* folders, as tree and blob objects. Thus, every time a new file is staged and committed, it will consume storage space in the repository.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

- Rewriting history to remove files from git history can be done with 'git filter-branch'. 

Steps:

# 1. Remove affected commits for 'file.txt' and delete it from repository
$ git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch file.txt' \
  --prune-empty --tag-name-filter cat -- --all

# 2. Cleanup the repository
$ git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin

# 3. Expire references to old commits on reflog
$ git reflog expire --expire=now --all

# 4. Run garbage collector (gc) to remove orphaned objects and free space
$ git gc --prune=now

# 5. Push rewritten history to remote server
$ git push origin --force --all
$ git push origin --force --tags

# 6. Update other clones
$ git fetch origin 
$ git reset --hard origin/master

# 7. Remove old commits to cleanup local clone
$ git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
$ git reflog expire --expire=now --all
$ git gc --prune=now

- BFG Repo-Cleaner can be used as an alternative to 'git filter-branch' for cleansing data out of Git repository history:
* https://rtyley.github.io/bfg-repo-cleaner/

4. What are the consequences of the previous action?
- Git has been designed to 'keep track of everything', so the best bet is to be careful when staging, committing, and especially pushing files to remote repositories. Resources like 'git filter-branch' and 'BFG' are available to fix mistakes and rewrite history, but they should be used carefully as they eliminate commits from the git history, making it impossible to 'travel back in time' and recover deleted snapshots. When a bad commit is pushed to a remote repository, the situation is even worse. The admins of the remote repositories need to be contacted to remove cached views and references to the compromised data in pull requests. Branches created off the old (tainted) repository should be rebased, not merged. 

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
