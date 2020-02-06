## Secrets (c01-git04)

Perform the following commands:
1. In the same repository of the previous exercise:
2. Add a file called `my_env.txt` that contains
    ```
    SERVICE_NAME=account-management
    ENVIRONMENT=prod
    PASSWORD=pass1234
    ```
1. Commit it
3. Check the commit with `git log`

**Questions**

Create a file **c01-git04-1.txt** answering the questions below. Include details and commands used.
1. Let's suppose you remotely pushed your `my_env.txt` file. A colleague asks you to remove this information from Git. What's your colleague worried about? 
2. If you modify the file in your workspace, then push it, will it be enough? (It's not). Why?
3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?
4. How to fix this? How do you remove something from Git history?
5. Which commands would you use? What are the consequences for other developers?
