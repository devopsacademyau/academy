# C05-ACTIONS02

Please provide the following:

- link to an open PR on the PLAYGROUND repository containing your GH Actions workflow.
  - [PR 115](https://github.com/devopsacademyau/playground/pull/115)
- attach to this PR the following files
  - [gh-actions-workflow.yaml](gh-actions-workflow.yaml) - file used to create GH actions workflow on PLAYGROUND repository

## Workflow

```yml
name: GPAVELAR/C05-ACTIONS02
on:
  pull_request:
    branches:
    - master
    paths: 'gpavelar/c05-actions02/**'

defaults:
  run:
    working-directory: 'gpavelar/c05-actions02'

jobs:
  comment:
    name: Deploy
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    
    - name: Set tag var
      id: vars
      run: |
        echo ::set-output name=tag::$(git rev-parse --short HEAD)
        echo ::set-output name=image::actions02
      
    - name: Docker build and tag
      run: |
        make docker-build
      shell: bash

    - name: Docker Push Image
      env:
        GPAVELAR_DH_TOKEN: ${{ secrets.GPAVELAR_DH_TOKEN }}
      run: make docker-push

    - name: Comment Image and Short SHA
      uses: mshick/add-pr-comment@v1
      with:
        message: "${{ steps.vars.outputs.image }}:${{ steps.vars.outputs.tag }}"
        repo-token: ${{ secrets.GPAVELAR_PAT }}
        allow-repeats: false 

    - name: Comment
      uses: mshick/add-pr-comment@v1
      with:
        message: "Well done ${{ secrets.GPAVELAR_USERNAME }} ! This is a nice PR"
        repo-token-user-login: 'github-actions[bot]'
        repo-token: ${{ secrets.GPAVELAR_PAT }}
        allow-repeats: false 

```

### Resources

[1](https://stackoverflow.com/questions/57819539/github-actions-how-to-share-a-calculated-value-between-job-steps)
[2](https://stackoverflow.com/questions/58886293/getting-current-branch-and-commit-hash-in-github-action)
[3](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions#outputs)
[4](https://stackoverflow.com/questions/59810838/how-to-get-the-short-sha-for-the-github-workflow)
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c05-actions01](https://github.com/devopsacademyau/academy/blob/b5dbe6a3266facbde88e657573d1fa946150b51f/classes/05class/exercises/c05-actions02/README.md)
