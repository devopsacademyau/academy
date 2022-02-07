# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
This has sensitive information stored in plain text. Anyone with access to this repo will be able to see this information.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
Absolutely not as it's still logged under past commits. 

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
No as there are still going to be previous versions of the file in the commit history.

4. How to fix this? How do you remove something from Git history when it is in the remote repository?
There are a few options to resolve this. git filter-repo  as per previous lesson is able to be used to remove this but does have risks if used improperly. There is also https://github.com/newren/git-filter-repo which is recommended as it's got some capabilities the above command might not.

5. Which commands would you use? Explain what the command does.
   If I had to use a command without the ability to use a third party tool such as the above it would be the following in the working directory:
git filter-repo --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA --invert-paths
After running the command replacing the path with the correct path to the file, send this to force the changes:
git push origin --force --all
You will need to use the force tag as this will have a different hash commit.

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)