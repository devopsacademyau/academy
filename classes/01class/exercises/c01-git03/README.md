## Big file (c01-git03)

Perform the following commands:
1. Initialize a new git repository **locally** (you don't need to push it)
2. Add a simple README.md text file (`touch README.md`) and commit it
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

**Questions**

Create a file **c01-git03-1.txt** answering the questions below. Include details and commands used.
1. Did you notice any difference in the size of the repo before and after adding the big file?
1. What is the reason for this problem?
1. How do you remove something from Git history? Which commands would you use? What are the consequences?
