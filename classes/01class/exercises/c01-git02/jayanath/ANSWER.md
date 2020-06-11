## Everyday questions (c01-git02 - optional)

1. Is it possible to see the inner commit of squashed commit with `git rebase`?
Yes. Using `git reflog` we can see the full history and go back to any of those squashed commits if needed.

2. How to compare two different local repositories using `git diff`? How about remote ones, can you do the same?
We can compare two local repositories using `git diff --no-index {path to the first repo} {path to the second repo}. 
If I have to compare two distinct remote repos, I would rather clone them both and compare in the same way as two local repos.

3. (Optional) Install [`ohmyzsh`](https://github.com/ohmyzsh/ohmyzsh) and activate the git plugin
Done. It came with git pluging activated by default.

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)

- **README.md**: copy from file [ANSWER.md](ANSWER.md), containing the answers.
