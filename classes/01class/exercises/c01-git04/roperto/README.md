# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

You may have some personal settings such as directories -- not a big deal, but they should not be committed in the project.

You may have some sensitive data like credentials which could be exploited -- that is a big deal and must be considered compromised.


2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

Because it is still available in the history.


3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

Same as above, the file is still in the history.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

You will need to change the history, either "editing" the commits with the file or deleting them.

Then you need to force-push it to "overwrite" the history in the remote.


5. Which commands would you use? Explain what the command does.

I will reference PR #896 as I elaborated my answer #3 there:

https://github.com/devopsacademyau/academy/pull/896/files#diff-5b6476fabaf32ae9536cb3d3ded0056aR20


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)