# Let's Get **Started** with Git

---
### Versioning: The "old way"

- Pessimistic locking, code duplication
    - Local versioning -> Copy and paste (Let's duplicate!)
    - Version overwriting (Who deleted my version!?)
    - Locked file (Can you please release file customers.xls, please!?)
- Are there other problems?


---
### What is Git?

- Created by Linus Torvalds in 2005 for development of the Linux kernel
- Git is a distributed VCS
- Centralized vs Distributed VCS?
- Optimistic vs Pessimistic locking?


![IMAGE](assets/git.0.jpg)

---

### Centralised vs Distributed VCS

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

---

### Optimistic Locking

![IMAGE](assets/OptimisticSketch.gif)


---

So, how git achieves optimistic locking so developers can work in parallel in the same file?

---

### Git Storage
![IMAGE](assets/git_storage.png)


---

### Git Main Commands 

- start a working area (see also: git help tutorial)
   - **clone**      Clone a repository into a new directory
   - **init**       Create an empty Git repository or reinitialize an existing one

- work on the current change (see also: git help everyday)
   - **add**        Add file contents to the index
   - **mv**         Move or rename a file, a directory, or a symlink
   - **reset**      Reset current HEAD to the specified state
   - **rm**         Remove files from the working tree and from the index

- examine the history and state (see also: git help revisions)
   - **bisect**     Use binary search to find the commit that introduced a bug
   - **grep**       Print lines matching a pattern
   - **log**        Show commit logs
   - **show**       Show various types of objects
   - **status**     Show the working tree status

---

### Git Main Commands (more)

- grow, mark and tweak your common history
   - **branch**     List, create, or delete branches
   - **checkout**   Switch branches or restore working tree files
   - **commit**     Record changes to the repository
   - **diff**       Show changes between commits, commit and working tree, etc
   - **merge**      Join two or more development histories together
   - **rebase**     Reapply commits on top of another base tip
   - **tag**        Create, list, delete or verify a tag object signed with GPG

- collaborate (see also: git help workflows)
   - **fetch**      Download objects and refs from another repository
   - **pull**       Fetch from and integrate with another repository or a local branch
   - **push**       Update remote refs along with associated objects


---

### Let's do it together
Let's add a folder to hold exercises for classes

1. Check README.md in the root for instructions.
2. Add, commit and push it to your remote dev branch :tada:
3. Create a Pull Request (PR)


---

### Checking in code can get complex (quickly!)
![IMAGE](assets/merge_hell.png)

How can we have a standard approach to work as one team?

---
### A solution: Trunk based development 

Short lived branches simplify a lot of things!
https://trunkbaseddevelopment.com/

See also GitFlow (https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
---

![IMAGE](assets/merge_vs_rebase.jpg)

---

### Merging vs Rebasing

`git checkout feature`
`git merge master`
![IMAGE](assets/merge.png)

`git checkout feature`
`git rebase master`
![IMAGE](assets/rebase.png)

---

### Let's do it together


1. Access https://learngitbranching.js.org/
1. merge - `level intro3`
1. rebase - `level intro4`


---

## What is the problem of re-writing the history with **git rebase**?

---

**Exercises**

1. file ex_git01.txt - Is it possible to see the inner commit of squashed commit with `git rebase`?
2. file ex_git02.txt - How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
3. Install [`ohmyzsh`](https://github.com/ohmyzsh/ohmyzsh) and git plugin
---

**Exercise ex_git03** - Big file and secrets

1. Initialize a new git repository locally
2. Add a simple text file and commit 
    - `echo "mypassword" > pwd.txt; git add pwd.txt; git commit -m "Add secret key file. I should not do it."`
3. Check the commit with `git log`
4. Check the size of the repository directory
    - On the parent, `du -sh .`
5. Add a fairly big file `file.txt` (around 100MB)
    - `dd if=/dev/random of=file.txt count=1024 bs=10257`
6. Add and commit it locally
    - `git add file.txt; git commit -m "Add big file"`
7. Check the size of the repository directory again (take note of this)
    - On the parent, `du -sh .`
8. Revert the commit that added the big file
    - use `git revert`, `git reset` or `git rebase`
9. Check the size of the repository directory again (take note of this)
    - On the parent, `du -h`

---

**Exercise ex_git03** - Big file and secrets

- Did you notice any difference in the size of the repo before and after adding the big file
- What is causing this problem?
- Let's suppose you remotely pushed your `pwd.txt` file. If you delete it and push it, is it enough? (It's not). Why?
- How do you solve it, i.e. how do you remove something from Git history? What are the consequences?


---

**OMG, I don't know what I did!**

https://ohshitgit.com/

---

### References

1. https://martinfowler.com/eaaCatalog/optimisticOfflineLock.html
1. https://www.teamstudio.com/blog/distributed-vs-centralized-version-control-systems-for-lotus-notes
1. https://www.atlassian.com/git/tutorials/merging-vs-rebasing
