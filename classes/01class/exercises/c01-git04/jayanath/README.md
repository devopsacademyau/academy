# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
```
Having a password in plain text
```
2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
```
No. Since git is keeping every version of a file, the password in plain text is still preserved in the initial commit.

```
3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
```
No. The previous version is still in the initial commit.
```
4. How to fix this? How do you remove something from Git history when it is in the remote repository?
```
We have to clone the repository, remove the specific file from each commit and recommit. 
This is effectively rewriting the history. Once done we can push the new changes to remote.
```
5. Which commands would you use? Explain what the command does.
```
We can use git filter-branch --tree-filter 'rm -f file-to-remove.txt' HEAD. 
However it is advised to use git filter-repo tool instead.[https://git-scm.com/docs/git-filter-branch#_warning] 

Install git filter-repo [https://github.com/newren/git-filter-repo] 
Clone the remote repository into a new place to have a clean reflog
Remove the specified file from each commit, and recommit the remaining changes 
using the following command and push

git filter-repo --invert-path --path file-to-delete.txt
git push

```
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)