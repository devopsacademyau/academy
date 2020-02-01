# Let's Get **Started** with Git

---
@snap[north-west text-center text-07]
### Versioning: The "old way"
@snapend

@snap[west]
@ul[list-spaced-bullets text-07]
- Pessimistic locking, code duplication
    - Local versioning -> Copy and paste (Let's duplicate!)
    - Version overwriting (Who deleted my version!?)
    - Locked file (Can you please release file customers.xls, please!?)
- Are there other problems?

@ulend
@snapend

---
@snap[north-west text-center span-50 text-07]
### What is Git?
@snapend

@snap[west]
@ul[list-spaced-bullets text-07 span-50]
- Created by Linus Torvalds in 2005 for development of the Linux kernel
- Git is a distributed VCS
- Centralized vs Distributed VCS?
- Optimistic vs Pessimistic locking?

@ulend
@snapend

@snap[north-east span-15]
![IMAGE](classes/class01/git/assets/git.0.jpg)
@snapend

---

@snap[north-west text-07 text-left]
### Centralised vs Distributed VCS
@snapend

@snap[west text-06]
- Centralised:
    - Centralised master version
    - Code Check outs (one developer is allowed to work on that part of the code at any one time.)
    - Locking controlled by the server
    - Release records version numbers of all elements
- Distributed:
    - Entire history of changes cloned by developers
    - No locking
    - Changes modify history (append or rewrite)
    - Release is a history of changes

Note:
- Centralised: RTC, ClearCase, Subversion
- Distributed: Git, Mercurial

---

@snap[north-west text-07 span-25 text-left]
### Optimistic Locking
@snapend

@snap[east span-50]
![IMAGE](classes/class01/git/assets/OptimisticSketch.gif)
@snapend

@snap[west text-05 span-50]
@quote[Prevents conflicts between concurrent business transactions by detecting a conflict and rolling back the transaction.](David Rice)
@quote[...Whereas Pessimistic Offline Lock assumes that the chance of session conflict is high and therefore limits the system's concurrency.](David Rice)
@snapend

---

@snap[west text-left text-07]
So, how git achieves optimistic locking so developers can work in parallel in the same file?
@snapend

---

@snap[west text-left text-07]
### Git Storage
![IMAGE](classes/class01/git/assets/git_storage.png)
@snapend

@snap[east span-40 text-08]
@box[bg-purple text-white](1. Working tree)
@box[bg-orange text-white](2. Index)
@box[bg-pink text-white](3. Local Repository)
@box[bg-blue text-white](4. Remote Repository)
@snapend

---

@snap[north-west text-left text-07]
### Git Main Commands 
@snapend

@snap[west span-45 text-05]
- start a working area (see also: git help tutorial)
   - **clone**      Clone a repository into a new directory
   - **init**       Create an empty Git repository or reinitialize an existing one

- work on the current change (see also: git help everyday)
   - **add**        Add file contents to the index
   - **mv**         Move or rename a file, a directory, or a symlink
   - **reset**      Reset current HEAD to the specified state
   - **rm**         Remove files from the working tree and from the index
@snapend

@snap[east span-45 text-05]
- examine the history and state (see also: git help revisions)
   - **bisect**     Use binary search to find the commit that introduced a bug
   - **grep**       Print lines matching a pattern
   - **log**        Show commit logs
   - **show**       Show various types of objects
   - **status**     Show the working tree status
@snapend

---

@snap[north-west text-left text-07]
### Git Main Commands (more)
@snapend

@snap[west span-45 text-05]
- grow, mark and tweak your common history
   - **branch**     List, create, or delete branches
   - **checkout**   Switch branches or restore working tree files
   - **commit**     Record changes to the repository
   - **diff**       Show changes between commits, commit and working tree, etc
   - **merge**      Join two or more development histories together
   - **rebase**     Reapply commits on top of another base tip
   - **tag**        Create, list, delete or verify a tag object signed with GPG
@snapend

@snap[east span-45 text-05]
- collaborate (see also: git help workflows)
   - **fetch**      Download objects and refs from another repository
   - **pull**       Fetch from and integrate with another repository or a local branch
   - **push**       Update remote refs along with associated objects

@snapend

---

@snap[north-west text-07]
### Let's do it together
@snapend

### Let's add a folder to hold exercises for classes
@snap[west text-07]
1. Check README.md in the root for instructions.
1. Add, commit and push it to your remote dev branch :tada:
1. Create a Pull Request (PR)

@snapend

---

@snap[north-west text-07]
## Checking in code can get complex (quickly!)
@snapend

@snap[center span-40 text-05]
![IMAGE](classes/class01/git/assets/merge_hell.png)
@snapend

---

@snap[north-west text-left text-07]
### Merge vs Rebase
@snapend

@snap[west span-40 text-05]
![IMAGE](classes/class01/git/assets/merge_vs_rebase.jpg)
@snapend

---

@snap[north-west text-left text-07]
### Merging vs Rebasing
@snapend

@snap[west span-40 text-05]
`git checkout feature`
`git merge master`
![IMAGE](classes/class01/git/assets/merge.png)
@snapend

@snap[east span-40 text-05]
`git checkout feature`
`git rebase master`
![IMAGE](classes/class01/git/assets/rebase.png)
@snapend

---

@snap[north-west text-07]
### Let's do it together
@snapend

@snap[west text-06]

1. Access https://learngitbranching.js.org/
1. merge - `level intro3`
1. rebase - `level intro4`

@snapend

---

@snap[middlepoint text-07]
## What is the problem of re-writing the history with **git rebase**?
@snapend

---

@snap[north-west span-25 text-07]
**Exercises**
@snapend

Submit with the file name indicated:
1. file ex_git01.txt - Is it possible to see the inner commit of squashed commit with `git rebase`?
1. file ex_git02.txt - How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
1. Install [`ohmyzsh`](https://github.com/ohmyzsh/ohmyzsh) and git plugin

---

@snap[north-west text-07]
**Exercise ex_git03** - Big file and secrets
@snapend

Folder ex_git03:
@snap[west text-06]
1. Initialize a new git repository locally
1. Add a simple text file and commit 
    - `echo "mypassword" > pwd.txt; git add pwd.txt; git commit -m "Add secret key file. I should not do it."`
1. Check the commit with `git log`
1. Check the size of the repository directory
    - On the parent, `du -sh .`
1. Add a fairly big file `file.txt` (around 100MB)
    - `dd if=/dev/random of=file.txt count=1024 bs=10257`
1. Add and commit it locally
    - `git add file.txt; git commit -m "Add big file"`
1. Check the size of the repository directory again (take note of this)
    - On the parent, `du -sh .`
1. Revert the commit that added the big file
    - use `git revert`, `git reset` or `git rebase`
1. Check the size of the repository directory again (take note of this)
    - On the parent, `du -h`
@snapend

---

@snap[north-west text-07]
**Exercise ex_git03** - Big file and secrets
@snapend

@snap[west text-06]
- Did you notice any difference in the size of the repo before and after adding the big file
- What is causing this problem?
- Let's suppose you remotely pushed your `pwd.txt` file. If you delete it and push it, is it still accessible for other people or it is safe?
- How do you solve it, i.e. how do you remove something from history? What are the consequences?

@snapend

---

@snap[north-west text-07]
**Oh s\*\*\* I don't know what I did!**
@snapend

@snap[west text-07]
https://ohshitgit.com/
@snapend

---

@snap[north-west text-center text-07]
### References
@snapend

@snap[west span-30 text-05]
1. https://martinfowler.com/eaaCatalog/optimisticOfflineLock.html
1. https://www.teamstudio.com/blog/distributed-vs-centralized-version-control-systems-for-lotus-notes
1. https://www.atlassian.com/git/tutorials/merging-vs-rebasing
@snapend
