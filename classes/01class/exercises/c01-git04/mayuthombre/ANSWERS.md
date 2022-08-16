# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

Colleague is most likely worried about access and secret keys that should not be shared with anyone. As a rule secret in plain text should never be shared on repository.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

No, it will not be. Because git keeps all previous versions of commits so secrets can still be found through previous logs.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

No, it will not be. Because git will create a new version of the file, but it will keep the old version on the history.


4. How to fix this? How do you remove something from Git history when it is in the remote repository?

To entirely remove unwanted files from a repository's history you can use either the git filter-repo tool or the BFG Repo-Cleaner open source tool.

5. Which commands would you use? Explain what the command does.

To illustrate how git filter-repo works,

    Install the latest release of the git filter-repo tool.
    $ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
    $ cd YOUR-REPOSITORY
    git filter-repo --invert-paths --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA
    $ echo "YOUR-FILE-WITH-SENSITIVE-DATA" >> .gitignore
    $ git add .gitignore
    $ git commit -m "Add YOUR-FILE-WITH-SENSITIVE-DATA to .gitignore"
    $ git push origin --force --all
    $ git push origin --force --tags


Reference article - https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

***
Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)