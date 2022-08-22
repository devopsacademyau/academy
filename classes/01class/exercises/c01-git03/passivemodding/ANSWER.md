# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?

Before adding
Size = 10KB

After creating 10MB file
Size = 10MB

After adding the 10MB file to repo
Size = 20MB

2. What is the reason for this problem?

Git tracks the history of all files in the repo. Since the history is tracked, the file will also be under the `.git/objects` directory as well as in the repo itself.

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 

`git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch file.txt" HEAD`

I would then add the `file.txt` to the `.gitignore` file to ensure it is not tracked in future commits.

4. What are the consequences of the previous action?

- file.txt will remain in the local working directory 
- file.txt will be removed from the full repo history
- Not reversible
- the repos history may be broken
- other users will likely need to clone the repo again to match the changes since history is rewritten

A better alternative to `git filter-branch` is `git filter-repo` which is recommended by the git project

`git filter-repo --invert-paths --path file.txt`

***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)
