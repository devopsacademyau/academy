# c01-git03

## Questions (answer inline)

1. Did you notice any difference in the size of the repo before and after adding the big file?
```
Yes, after creating the file it grew 100M as expected. After committing the file it grew around 100M more.
```

2. What is the reason for this problem?
```
That's not exactly a problem, just how git works. It copies the file as an object inside the repository
so it can be associated with a commit (usually .git directory).

Even if you delete the file from the working directory the "committed" file will still be there.

Even if you delete the commit, most likely the "dangling" commit will still be there (although that can be cleaned).
```

3. How do you remove something from Git history after it is pushed to the remote repository? Which commands would you use? 
```
You need to remove the file from every commit and force-push it.

In this case, the commands would be:
$ git reset @~   # go back before the commit with the big file
$ git push -f    # we need to force-push as we are rewriting history

You can use the following commands to recover the space locally:
$ git reflog expire --all --expire-unreachable=now
$ git gc --aggressive --prune=now

Other alternatives:
- do an interactive rebase and edit the specific commit.
- use 'git filter-branch' to remove a file from several commits
- get a "Big Fuc*ing Gun" that will shoot a green plasma ball obliterate all unwanted stuff on its path DOOM-Style.
  (seriously, BFG is a great tool to remove unwanted secrets from history)

Regardless, if you pushed a secret to a public you should always consider it compromised.

There are bots scanning GitHub and GitLab (probably others) looking for credentials, keys and certificates.
```

4. What are the consequences of the previous action?
```
If it was a simple feature branch that nobody else uses not much.

If you did that to an important branch like "master" you better buy a chocolate box for your team.

They will need to reset their local copies and any derived branches they are working on,
possibly cherry-pick (interactive rebase may help with that) things they have already committed.

A direct rebase will fail as it will try to reintroduce the "deleted" commits.

I strongly suggest talking to everyone BEFORE force-pushing that -- it will allow others to merge stuff
before you do rewrite history.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-git03](https://github.com/devopsacademyau/academy/blob/23cc1dfa31e85651e3cdc1b0ef38da21518841ba/classes/01class/exercises/c01-git03/README.md)