# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
```
My colleague is worry about the kind of information that I exposed to the whole team or even to the out of the company.
```

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
```
Because that information still is within git. We can, for instance, get the commit before the modified file and see that previous information again.
```

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
```
Because we can get previous commits and see back the file with the password information. 
```

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
```
In order to definitely remove some files from git, we can use git filter-repo command. As an additional step, we can also add it to .gitignore to make sure that it will not happen again.
```

5. Which commands would you use? Explain what the command does.
```
Firstly, go to the repository's working directory. Then run the following command replacing PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA properly. With git filter-repo command you should be able to rewrite the history on git in a simpler and safer way. In order to keep all files except that path, just add --invert-paths.

$ git filter-repo --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA --invert-paths

Finally, run the command below to send the change to remote (As you now have a different hash commit, you must use --force to be able to push)

$ git push origin --force --all
```


***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)