# c01-git03

1. Did you notice any difference in the size of the repo before and after adding the big file?

> Yes. The repository's size increases after adding the big file.

2. What is the reason for this problem?

> Thi is because of the Git Object Store. It contains your original data files and all the log messages, author information, dates, and other information required to rebuild any revision or branch of the project.
> Every object consists of three things- a type, a size, and content. The size is simply the size of the contents, the content depends on what type of object is, and there are four different types of objects: `blob`, `tree`, “commit”, and “tag”. Git stores these different types of objects in `.git/objects`.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
> In order to remove something from Git history you have to rewrite the repository's history.
> To remove unwanted files from a repository's history you can use the `git filter-branch` command.

>So, you can permanently remove a folder from a git repository with:

```bash
 git filter-branch --tree-filter 'rm -rf <folder-path>' HEAD
```
> Which will go through the whole commits history in the repository, one by one change the commit objects and rewrite the entire tree.
> We use -r (recursive) parameter for recursive remove, and -f (force) to ignore nonexistent files (since folder/files may not be introduced to the repository within the commits range on which we do branch filter).

> At the end, don't forget to push the changes to the repository with --force, since this is not a fast forward commit, and the whole history within the commits range we filtered will be rewritten.
```bash 
git push origin master --force
```

> To dereference, expire reflog (which by default is 90 days) and force garbage collect, you can do:

```bash
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
```

> You'll need to make sure all branches and tags are pushed to remote (unless you're pushing to a new repo).

```bash
git push origin --force --all
git push origin --force --tags
```

4. What are the consequences of the previous action?
> Rewriting your git history is a very destructive process and after doing so you have to force push your changes and everybody working with the repository has to clone the repository again so please be very careful

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)