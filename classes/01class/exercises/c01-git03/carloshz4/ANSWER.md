# c01-git03

## Questions (answer inline)

### 1. Did you notice any difference in the size of the repo before and after adding the big file?

Yes, size increased from 88K to 201M, which is an increase of around double the size of the large file created. Even after resetting to previous commit the size was 201M.

### 2. What is the reason for this problem?

This is probably because when commiting the file is added to the repo history.  After resetting to previous commit the following can be done to prune the file from history:

```
  git reflog expire --expire=now --all
  git gc --prune=now --aggressive
```

### 3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

To remove the lastest commit from history do:

- Make sure you are in the right branch

```
git branch
git checkout <yourbranch>
```

- Revert the lastest commit from the remote repo:

```
git revert HEAD
````


### 4. What are the consequences of the previous action?


It'll create a new commit with the changes to be reverted.




***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
