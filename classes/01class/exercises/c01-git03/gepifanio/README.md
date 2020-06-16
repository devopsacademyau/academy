# c01-git03

➜  Projects mkdir test-git
➜  Projects cd test-git
➜  test-git ls
➜  test-git git init
Initialized empty Git repository in /Users/goliveiraepi/Projects/test-git/.git/
➜  test-git git:(master) touch README.md
➜  test-git git:(master) ✗ git add .
➜  test-git git:(master) ✗ git commit -m "First commit"
[master (root-commit) 4fa83bc] First commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.md
➜  test-git git:(master) du -sh .
 96K	.
➜  test-git git:(master) dd if=/dev/random of=file.txt count=1024 bs=10257
1024+0 records in
1024+0 records out
10503168 bytes transferred in 0.036068 secs (291204915 bytes/sec)
➜  test-git git:(master) ✗ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	file.txt

nothing added to commit but untracked files present (use "git add" to track)
➜  test-git git:(master) ✗ git add .
➜  test-git git:(master) ✗ git commit -m "add big file"
[master bc4c8c0] add big file
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file.txt
➜  test-git git:(master) du -sh .
 20M	.
➜  test-git git:(master) git revert HEAD
[master a209dd9] Revert "add big file"
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 file.txt
➜  test-git git:(master) du -h
4.0K	./.git/objects/a2
4.0K	./.git/objects/bc
4.0K	./.git/objects/18
  0B	./.git/objects/pack
  0B	./.git/objects/info
4.0K	./.git/objects/e6
4.0K	./.git/objects/f9
 10M	./.git/objects/f7
4.0K	./.git/objects/4f
 10M	./.git/objects
4.0K	./.git/info
4.0K	./.git/logs/refs/heads
4.0K	./.git/logs/refs
8.0K	./.git/logs
 48K	./.git/hooks
4.0K	./.git/refs/heads
  0B	./.git/refs/tags
4.0K	./.git/refs
  0B	./.git/branches
 10M	./.git
 10M	.
➜  test-git git:(master)

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, from 96K to 20M after adding the big file, but once reverted the repo still had 10M.

2. What is the reason for this problem?

Because the big file still in the git history, because git tracks the whole history of the repo, it shows it had that big file once, and the reference of this file still there.


3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD


If you want to push it to remote repo just do git push

git push -all --force

1. What are the consequences of the previous action?

It rewrites the whole history, which changes all the commit ids and will definately affect other users of the same repository. 

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)