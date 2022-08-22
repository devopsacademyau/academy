# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> Colleague is most likely worried about access and secret keys that should not be shared with anyone. As a rule secret in plain text should never be shared on repository.
Additionally, it could affect the pipeline for dev, prod, etc

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> No, it will not be. Because git keeps all previous versions of commits so secrets can still be found through previous logs.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

> No, it will not be. Because git will create a new version of the file, but it will keep the old version on the history.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

> In order to delete file from Git history, you have to use the “git filter-branch” command and specify the command to be executed on all the branches of your Git history.


5. Which commands would you use? Explain what the command does.


$ git filter-branch --force --index-filter --prune-empty "git rm --cached --ignore-unmatch <path_to_file>" HEAD

As the command is quite complex, here is a breakdown

–force : forces the filter-branch to start even if it may not want to 
–index-filter : option used in order to rewrite the index, exactly what we want in the case of a file deletion
-git rm : the command to be executed on all branches, revisions and commits matching in the history, in this case it will remove the file from the repository and ignore files that don’t match
–prune-empty : avoid having empty commits in the repository with zero files, this option will prune commits automatically


***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)