# c01-git02

## Answers

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
```
Yes. Using git reflog --all we can see the full history.
```

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
```
We can compare two local repositories using git diff --no-index {path to the first repo} {path to the second repo}
We can add any number of remotes to our local repo and compare using the same git diff command. Below is an example.

➜  bigfiletest git:(master) git remote add -f remote1 git@github.com:devopsacademyau/academy.git
➜  bigfiletest git:(master) git remote add -f remote2 git@github.com:jayanath/ghost-blog-in-aws.git
➜  bigfiletest git:(master) git remote -v
remote1	git@github.com:devopsacademyau/academy.git (fetch)
remote1	git@github.com:devopsacademyau/academy.git (push)
remote2	git@github.com:jayanath/ghost-blog-in-aws.git (fetch)
remote2	git@github.com:jayanath/ghost-blog-in-aws.git (push)
➜  bigfiletest git:(master)
➜  bigfiletest git:(master)
➜  bigfiletest git:(master) git diff master remotes/remote1/master
➜  bigfiletest git:(master) git diff master remotes/remote2/master
➜  bigfiletest git:(master) git diff remotes/remote1/master remotes/remote2/master
➜  bigfiletest git:(master)
➜  bigfiletest git:(master) git remote rm remote1
➜  bigfiletest git:(master) git remote rm remote2
```
***
Answer for exercise [c01-git02](https://github.com/devopsacademyau/academy/blob/c54d252bda58575e9dc9f92718237bed58aae772/classes/01class/exercises/c01-git02/README.md)
