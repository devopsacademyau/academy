c01-git02

1. Is it possible to see the inner commit of squashed commit with git rebase?
yes we can .
using the following command : 
```
 git reflog 

```
2. How to compare two different local repositories using git diff? How about remote ones, can you do the same?


Local Repositories:

```
git diff HEAD [filename] ---HEAD -refer to the local Repository
ex: git diff HEAD helloworld.txt

```
Remote Repositories:

```
git diff <local branch> <remote>/<remote branch>
ex: git diff master origin/master

```

