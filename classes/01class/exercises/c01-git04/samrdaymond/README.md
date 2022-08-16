# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

that you have pushed a plaintext password


2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

no, the password will still be in the previous commit

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

same as above the file would still exist in the previous commit

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

the file would need to be removed from the git history completely using the same command as the previious exercise filter-branch" and "git rm" then forcing a push back to the remote repo

5. Which commands would you use? Explain what the command does.
"git filter-branch --tree-filter 'rm -f my_env.txt' HEAD" this command finds and removes the file specified "my_env.txt"
after removal we would also want to run "git push origin --force --all" this would push our changes back to the repo

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)