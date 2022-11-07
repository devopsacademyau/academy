## Secrets (c01-git04)

Perform the following commands:
1. In the same repository of the previous exercise:
2. Add a file called `my_env.txt` that contains
    ```
    SERVICE_NAME=account-management
    ENVIRONMENT=prod
    PASSWORD=pass1234
    ```
1. Commit it to your local repository
2. Check the log with `git log`

**Questions**

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?
2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?
3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
4. How to fix this? How do you remove something from Git history when it is in the remote repository?
5. Which commands would you use? Explain what the command does.

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)

- **README.md**: copy from file [ANSWER.md](ANSWER.md), answering the questions above. Include details and commands used.