# Intro to Reviewers build process

## Github Workflows

The Reviewers build automation uses two GH workflows located on below paths:

- [.github/workflows/reviewer-setup.yaml](/.github/workflows/reviewer-setup.yaml)
- [.github/workflows/reviewer-build-push.yaml](/.github/workflows/reviewer-build-push.yaml)

The first `setup` workflow gets triggered on each `pull_request` and `push` events and will gather a list of all exercises Reviewers that have its files changed and require a new build.

It will then trigger the second workflow `build-push` to:

- **on pull_requests**: build and push the Reviewer container with a tag `devopsacademyau/reviewer:<exercise_name>-<version>-pr-<pr_number>`
- **on push to master**: build and push the Reviewer container with tags `devopsacademyau/reviewer:<exercise_name>-<version>` and `devopsacademyau/reviewer:<exercise_name>-latest`


## Setup new exercises build

To add a new exercise to the build automation you will have to:

- add a new <exercise_name> folder under [/reviewer/exercises/](/reviewer/exercises)
- provide all the required files to build the reviewer within that folder (Dockerfile, scripts, etc)
- modify the [.github/workflows/reviewer-setup.yaml](/.github/workflows/reviewer-setup.yaml) adding the <exercise_name> as part of the `dorny/paths-filter@v2` action filters as per below:

```yaml
- uses: dorny/paths-filter@v2
id: changes
with:
    list-files: json
    # better to list individually to have a cleaner integration with matrix strategy when calling build jobs
    filters: |
    git03:
        - 'reviewer/exercises/git03/**/*'
    git04:
        - 'reviewer/exercises/git04/**/*'
    <exercise_name>:
        - 'reviewer/exercises/<exercise_name>/**/*'
```

Once this is done, next time you submit a PR with changes within `'reviewer/exercises/<exercise_name>/**/*'` folder, the container will be build and pushed to DockerHub.