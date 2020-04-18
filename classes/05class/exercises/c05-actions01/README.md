# Basic Github Action using public runners (c05-actions01)

You need to create a GH Action (workflow) that will comment on every pull request created that changes your files on the [PLAYGROUND](https://github.com/devopsacademyau/playground) repository.

TIP: look for an existing actions from the official community [Marketplace](https://github.com/marketplace?type=actions)

Please follow the below steps to complete this task:

- Create a PR to add a new folder with your github username on the PLAYGROUND repository root `/`. 
- You should be able to merge your own PR without an approval. (let us know if not)
- You will need to generate a GH token to be able to interact with GH api. https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line
- Please use SECRETS to refer your GH token when creating your workflow. https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets

**DON'T HARDCODE YOUR GH TOKEN ON YOUR CODE.**

- Your workflow should be triggered every time a PR to change a file under `/<your-github-username>/*` is created
- Once the workflow is triggered, a job should comment the PR with:

`Well done $MY_NAME ! This is a nice PR`

- `$MY_NAME` need to be replaced with **YOUR** name using **SECRETS**.


## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
    - workflow yaml file used
