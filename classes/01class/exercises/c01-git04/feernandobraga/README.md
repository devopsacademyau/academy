# c01-git04

## Questions (answer inline)

1. Let's suppose you remotely pushed the `my_env.txt` file above. A colleague asks you to remove this information from Git. What's your colleague worried about?

```
My colleague is worried about the fact that the file contains sensitive information (credentials that refer to a production server), and because I pushed it to a remote repository, anyone with access to that repository can now see the content of it.
```

2. If you modify the file in your workspace, then commit and push it, will it be enough to erase this password information from the repository? (It's not). Why?

```
The procedure suggested won't be enough because as we saw in previous exercises, anyone can "travel back in time" based on git's history and get the credentials from the mistaken commit.
```

3. If you delete the file and push it, then create a new one with the rest of the information, is it enough? (It's not). Why?

```
This still not enough as anyone with access to the remote repository can retrieve the information by navigating through the history.
```

4. How to fix this? How do you remove something from Git history when it is in the remote repository?

```
We can fix this by using git filter-repo
```

5. Which commands would you use? Explain what the command does.

```
The command I would use is:
git filter-repo --path "my_env.txt" --invert-paths

Then:
git push --force

The two commands above will erase the history of commits where the file my_env.txt is contained. Next, it forces an update to the remote repository
```

---

Answer for exercise [c01-git04](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git04/README.md)
