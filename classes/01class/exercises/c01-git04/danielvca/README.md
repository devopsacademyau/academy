

# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> We`re not supposed to store sensitive information in our repo. We can
> also leverage services like key_vault to store this kind of info.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> No, Git object store would still have a copy of the said file.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

> No. Sensitive information can still be retrieved as the history would
> still be accessible.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

> We can either use bfg or a combination of git rebase and git
> filter-branch

5. Which commands would you use? Explain what the command does.
   

> bfg is supported by github and easier to use. I`d use:

```shell
bfg --delete-files my_env.txt
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
> Written with [StackEdit](https://stackedit.io/).
