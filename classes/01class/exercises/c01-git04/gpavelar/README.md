# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

> My colleagues are worried about our security due to the fact that `my_env.txt` file could contain many acess keys and private information (it stores all essential configurations). Once this env file there, you can just delete it. But if it is a public repository and you dig into history anyone can get any data/key from that.
> First way to avoid this happen is adding that you don't want to push into `.gitignore` file.

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

> It's not enough. Git stores all changes, you anyone can look back and check any deleted file or changes on any commit hash.

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

4) How to fix this? How do you remove something from Git history when it is in the remote repository?

> I would use the same answer from previous exercise. So we are suppose to rewrite and alter git history. According to [Github help](https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository) there is a free tool called [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) that is 10-720x faster than `git filter-branch` and remove unwanted data. I didn't try to use `bfg`.

5. Which commands would you use? Explain what the command does.

If you want remove sensitive data on the correct way if it is in the remote repository.
This command pass through all files analyzing the complete file-hierarchy to find any match and removing the selected file.

```bash
# Clone you remote repository
git clone --mirror YOUR_REPOSITORY
# Acess your repository directory
cd YOUR_REPOSITORY
# Git command to remove specific file and commits generated
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch PATH/my_env.txt" \
  --prune-empty --tag-name-filter cat -- --all
# Add you env file to .gitignore
echo "PATH/my_env.txt" >> .gitignore
# Add changes on git stage
git add .gitignore
# Commit changes
git commit -m "Update .gitignore to avoid env file"
# Push all changes on all github repositories
git push origin --force --all
```

---

Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
