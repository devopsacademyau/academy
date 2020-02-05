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
![IMAGE](classes/01class/git/assets/git.0.jpg)
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

---

@snap[north-west text-07 span-25 text-left]
### Optimistic Locking
@snapend

@snap[east span-50]
![IMAGE](classes/01class/git/assets/OptimisticSketch.gif)
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
![IMAGE](classes/01class/git/assets/git_storage.png)
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
Let's add a folder to hold exercises for classes
@snapend

@snap[west text-07]
1. Check README.md in the root for instructions.
2. Add, commit and push it to your remote dev branch :tada:
3. Create a Pull Request (PR)

@snapend

---

@snap[north-west text-07]
### Checking in code can get complex (quickly!)
![IMAGE](classes/01class/git/assets/merge_hell.png)
@snapend

@snap[south text-05]
How can we have a standard approach to work as one team?
@snapend

---
@snap[north-west text-07]
### A solution: Trunk based development 
@snapend

@snap[middlepoint text-07]
Short lived branches simplify a lot of things!
https://trunkbaseddevelopment.com/
@snapend

@snap[south-west text-04]
[See also GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
@snapend
---

@snap[midpoint span-60 text-05]
![IMAGE](classes/01class/git/assets/merge_vs_rebase.jpg)
@snapend

---

@snap[north-west text-left text-07]
### Merging vs Rebasing
@snapend

@snap[west span-40 text-05]
`git checkout feature`
`git merge master`
![IMAGE](classes/01class/git/assets/merge.png)
@snapend

@snap[east span-40 text-05]
`git checkout feature`
`git rebase master`
![IMAGE](classes/01class/git/assets/rebase.png)
@snapend

---

@snap[middlepoint text-07]
## What is the problem of re-writing the history with **git rebase**?
@snapend

---

@snap[north-west text-07]
### Let's do it together - Exercise
@snapend

@snap[west text-06]
**Merging and Rebasing**
1. Access https://learngitbranching.js.org/
2. Merging exercise:
   1. type `level intro3`
   2. Include your commands on a file **answer01.txt**
3. Rebasing exercise:
   1. type `level intro4`
   2. Include your commands on a file **answer02.txt**

@snapend

---

@snap[north-west text-07]
**OMG, I don't know what I did!**
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
