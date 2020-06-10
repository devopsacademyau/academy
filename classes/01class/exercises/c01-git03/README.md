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

1. Did you notice any difference in the size of the repo before and after adding the big file?
2. What is the reason for this problem?
3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
4. What are the consequences of the previous action?

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)

- **README.md**: copy from file [ANSWER.md](ANSWER.md), answering the questions