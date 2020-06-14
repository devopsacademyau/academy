# c01-git04

```
commit f6a7fa270449a0feff33fb58f6a338370ffe125f (HEAD -> master)
Author: Guilherme Epifanio <gui.epifanio@gmail.com>
Date:   Sat Jun 13 17:03:47 2020 +1000

    my env details

commit a209dd9946b0ca9d24e7c35c26a98258df2ea023
Author: Guilherme Epifanio <gui.epifanio@gmail.com>
Date:   Sat Jun 13 16:52:28 2020 +1000

    Revert "add big file"

    This reverts commit bc4c8c0f47540faa78d22314b09abb51bf3fab57.

commit bc4c8c0f47540faa78d22314b09abb51bf3fab57
Author: Guilherme Epifanio <gui.epifanio@gmail.com>
Date:   Sat Jun 13 16:52:03 2020 +1000

    add big file

commit 4fa83bcd7b9c4ebdc371dbd52468f012bc92e71a
Author: Guilherme Epifanio <gui.epifanio@gmail.com>
Date:   Sat Jun 13 16:51:27 2020 +1000

    First commit
```

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

That file has sensitive information such as password and shouldnt be in a file inside of the project folder.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No, because it has been commited once, and the git tracks the whole history, and will show all those information in the history.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No, because still will be in the history of git, and anyone with the access to the repo will be able to see those details like checking my git log from the file I have deleted

```
commit a209dd9946b0ca9d24e7c35c26a98258df2ea023
Author: Guilherme Epifanio <gui.epifanio@gmail.com>
Date:   Sat Jun 13 16:52:28 2020 +1000

    Revert "add big file"

    This reverts commit bc4c8c0f47540faa78d22314b09abb51bf3fab57.

commit bc4c8c0f47540faa78d22314b09abb51bf3fab57
Author: Guilherme Epifanio <gui.epifanio@gmail.com>
Date:   Sat Jun 13 16:52:03 2020 +1000

    add big file
```

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

you can use the command

git rebase -i 

to rewrite and delete commits from the history

but to be applied to the remove, you need to push it to remote but in a forced way, as git will deny if you try to only push something that differs from the remote.

5. Which commands would you use? Explain what the command does.


$git rebase -i

pick the commits to be rebased and rewrited.

after push it forced to the remote using

git push origin HEAD -f


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)