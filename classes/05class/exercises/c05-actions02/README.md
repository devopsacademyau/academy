# Github Action to push a container image to Dockerhub (c05-actions02)

Using 3Musketeers (don't use marketplace actions), create a workflow that will:

- build a simple container image. Something like this is enough:
  ``` 
    FROM httpd:2.4.41
    RUN echo "This is my GH actions exercise" > /usr/local/apache2/htdocs/index.html
  ```
- tag the container image with the commit `SHORT_SHA` (SHORT_SHA's are usually the last 4-6 digits of the commit SHA) i.e `my-image:123456`
- push to dockerhub
- comment to the PR the new image name with tag pushed to Dockerhub

Please follow the below steps to complete this task:

- Save all your files on the [PLAYGROUND](https://github.com/devopsacademyau/playground) repository under `/yourgithub-username/c05-actions02/***`
- Generate any GitHub or DockerHub tokens required
- Reference tokens as SECRETS - **DON'T HARDCODE YOUR GH TOKEN ON YOUR CODE.**
- Raise a PR with some `Dockerfile` changes
- Check if image gets deployed to Dockerhub
- Check if PR gets commented with new image name/tag

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
