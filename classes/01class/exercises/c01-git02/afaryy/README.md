# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
#Yes. Git reflog can list the commit info
git reflog
```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
- To compare two local repos
```
git diff --no-index <path1> <path2>
OR
cd /path/to/repo_a/
git --work-tree=/path/to/repo_b/ diff
```
- To compare two remote repos
```
git remote add -f a path/to/repo_a.git
git remote add -f b path/to/repo_b.git
git remote -v
git remote update
git diff remotes/a/master remotes/b/master
git remote rm a; git remote rm b
```
- To compare a local and a remote repos
```
git diff <local branch> <remote>/<remote branch>
git fetch origin master
git diff master origin/master
```
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Ref: https://stackoverflow.com/questions/30771920/how-to-diff-two-local-repositories?lq=1  
https://stackoverflow.com/questions/1968512/getting-the-difference-between-two-repositories  

Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
