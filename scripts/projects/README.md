# Objective
The `project.sh` script will create issues, based on files that exists in the `issues` folder, in the repository that is passed as variable `${PROJECT}`. After creating the issues, the script will convert it to cards in the Backlog column of the project with the same name as the repository name.


# How to use

- Follow Github instructions to generate a new personal token with enough permissions to manage the organisation

https://github.com/settings/tokens/new

- Export an environment variable with your GH token

`export GH_TOKEN=<token>`

- Export an envionment variable with your GH username

`export GH_USER=<username>`

- Run the following command to create cards with content of json files from the `issues` folder in the Backlog column:

PROJECT="<group-repo-name>" ./project.sh
