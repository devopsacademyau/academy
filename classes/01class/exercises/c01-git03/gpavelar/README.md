# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

> According to those commands `du -sh` and `du -h` the size of the repo was around 4.0K before `git init` command.
> After that the repository created locally and run all commands required it was around 170K. The command `git init` creates hidden files under the directory `.git` containing all metadate for this new repository to keep track of everything.
> Adding a big file into this repository its size increase a bit bit, size around 125M (I created another file a little bit bigger). When you add this file into the repository, .git directory increases its size due to the fact it now trying to store/manage this big file that its size is above git limits. Eventually, GitHub will block pushes that contain files over 100MB.

2. What is the reason for this problem?

> Git was created originally to handle source code that was quite small. Github has a size limit for files to not overload servers and decrease the performance. And it keeps track of any change in a binary file (whole history) as well.
> So it could be a serious problem when cloning repositories and pushing them.
> A simple way to overcome it using `git lfs` (git large filesystem) 'extension' on the computer. It creates a pointer to your 'big file' that is stored into git lfs system.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use?

> You are able to remove anything from git history, but it depends on what you want. On this case with the big file from previous exercise.

```
git rm --cached file.txt
git commit --amend -CHEAD --allow-empty
git push --force --all
```

or

if you want remove everything

```
git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch file.txt" HEAD
git push -all
```

Parameters:

- --filter-branch: Allow you rewrite git revision history
- --index-filter: Rewrite git indexes
- git rm: remove file
  - -rf: remove recursively and force override the latest check
  - --cached: content that you want to remove need to match on branch and on your disk
  - --ignore-unmatch: exit 0 if it finds or not.
  - HEAD: pointer to current branch reference.
- --amend CHEAD: add changes that you forgot to the last commit keeping the message of last commit.

4. What are the consequences of the previous action?

> Those commands remove the file from local repository on your computer and github, we need to pay attention when run any of those commands. It will affect everybody working on this remote repository. Is recommended that all opened PR must be closed before do that.

---

Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
