# DevOps Academy

<p align="center">
    <img src="docs/logo.png" width="300">
</p>

This non-profit repository intention is to help the community to learn the DevOps methodology and culture throughout a series of classes and hands-on laboratories and become ready to start working as Automation/Cloud/DevOps Engineer.

Feel free to contribute with content (PR), help peer reviewing code or just going through the exercises!

If you want to make part of the team behind this, get in touch on help@devopsacademy.com.au.

# Table of Content

- [DevOps Academy](#devops-academy)
- [Table of Content](#table-of-content)
- [How it Works](#how-it-works)
- [Requirements](#requirements)
- [Content](#content)
  - [Classes](#classes)
  - [Exercises](#exercises)
  - [Projects](#projects)
- [Contributors and Instructors](#contributors-and-instructors)
    - [Presentation format](#presentation-format)
- [Authors](#authors)
  - [Caio Trevisan](#caio-trevisan)
  - [Denis Storti](#denis-storti)
  - [Francisco Collet](#francisco-collet)
- [Sponsors](#sponsors)


# How it Works

To complete the DevOps Academy, you will have to go through 8 classes with hands-on exercises. For each exercise, you will have to submit your code via pull requests to this repository as per [instructions](#exercises). The last two labs are complete projects based on current industry needs.

You will also be required to peer review at least 5 pull requests from other students to finish this course.

# Requirements

Please find below the requirements to complete this course:

- Slack
- Github Account
- AWS Account
- AWS cli
- Terraform
- Visual Studio Code
- Docker

If you need help in any of these topics, [a tutorial is available on the pre-class](classes/00pre-class/README.md):


# Content

- Version Control (GIT)
    - What is it?
    - Benefits
    - Basic commands
    - How to clone/fork/pr this repository
- Agile methodology
    - Frameworks
    - Scrum
    - Kanban
- Infrastructure as Code
    - Concepts
    - Terraform introduction
- Containers
    - Concepts
    - Docker images
    - Docker Compose
    - 3Musketeers
- CI/CD
    - What is CI
    - What is CD
    - Pipelines
- Amazon Web Services (AWS)
    - Cloud concepts
    - Identity and Access Management (IAM) / CloudTrail / CloudWatch
    - VPC / Subnet / route table / network acl / security group
    - EC2 / auto-scaling group / load-balancer
    - Simple Storage Service (S3)
    - RDS / DynamoDB
    - Cloudfront / WAF
    - Route53 / Certificate Manager (ACM)
    - Elastic Container Service (ECS) / Elastic Container Registry (ECR)
    - Lambda

The content can be accessed through each specific README link below.

## Classes

- [Class 01](classes/01class/README.md)
    - DevOps Academy Introduction
    - Introduction to AWS
    - Git
- [Class 02](classes/02class/README.md)
    - Agile Methodologies
    - AWS IAM
    - AWS Network Deep Dive
- [Class 03](classes/03class/README.md)
    - AWS EC2
        - Load Balancing
        - Auto Scaling Group
    - AWS S3
    - AWS Route 53
    - Container - Docker
        - Repositories
        - Images
        - Dockerfile
        - AWS ECS
- [Class 04](classes/04class/README.md)
    - AWS - IAM Keys
    - AWS - CLI
    - AWS - RDS
    - IaC - Terraform
    - MakeFile
- [Class 05](classes/05class/README.md)
    - Project #1 Delivery
- [Class 06](classes/06class/README.md)
    - CI/CD Concepts
    - Pipelines
    - 3 Musketeers
- [Class 07](classes/07class/README.md)
    - Serverless
- [Class 08](classes/08class/README.md)
    - Project #2 Delivery


## Exercises

For each class exercise, create a new branch following `<github-account>/<exercise-number>` and add your work on a folder like `classes/<class name>/exercises/<exercise-number>/<your github user>/`.

Exercise submissions can be textual like a simple .txt file or more complex containing several files and folders.

Example: 
`classes/01class/exercises/c01-e01/caiocezart/<my-files>`

To submit exercises, you will have to:

- clone this repository

```bash
git clone <repo-url>
```

- [OR fork it to your own GitHub account and clone from there](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)

- create a new branch with branch name containing exercise number and your name

```bash
git checkout -b caiocezart/c01-e01
```

- create a folder with your `github username` (e.g. `denstorti`, `kikobr82`, ...)

```bash
cd <repo-name>

mkdir classes/01class/exercises/c01-e01/<my-name>
```

- add your code, create a commit with the change and push it

```bash
cd classes/01class/exercises/c01-e01/<my-name>
touch newfile

# commit and push
git add newfile
git commit -m "adding a new file"
git push
```

- create a `pull request` from your branch to master
- wait until you get at least two review approvals, one being from the instructors
- once you have the approvals, you will merge your code to master and complete the exercise

Upon completion of your first exercise, you will be given permission to start/help peer reviewing other community members code! 

### Available labs

- [Class 01: (AWS & GIT 101)](/classes/01class/exercises/README.md)


## Projects

More info to come..

- [Project 01 - Application migration from on-prem to the cloud](projects/project01/README.md)
- [Project 02 - Cloud native application architecture on AWS](projects/project02/README.md)

Projects will be submitted in the respective project `submissions` folder via PRs.

Example:
`projects/project01/submissions/caiocezart/<my-files>`


# Contributors and Instructors

## Presentation format

* We are using plain README.md files with markdown or [GitPitch](https://gitpitch.com/docs/markdown-features/basics/) for slideshow presentations
* For GitPitch, use PITCHME.md files and subfolders using query string "p=FOLDERNAME" with the class name
* GitPitch can run either online (out-of-the-box for Github public repos):
    * Online: access `https://gitpitch.com/${ORG_NAME}/${REPO_NAME}/${BRANCH_NAME}?p=${FOLDER_NAME}`. Folder must contain a PITCHME.md file.
    * Offline: use a [Docker container](https://github.com/kns-it/Docker-GitPitch/), run `make presentation` and `open http://localhost:9000/${ORG_NAME}/${REPO_NAME}/${BRANCH_NAME}?p=${FOLDER_NAME}`
    For running in a specific folder: `FOLDER_NAME=class2 make presentation`


# Authors

## Caio Trevisan

- Linkedin: [https://www.linkedin.com/in/caiocezart/](https://www.linkedin.com/in/caiocezart/)
- Website: [www.caiotrevisan.com](https://www.caiotrevisan.com)

## Denis Storti

- Linkedin: [https://www.linkedin.com/in/denstorti/](https://www.linkedin.com/in/denstorti/)
- Github: [https://github.com/denstorti](https://github.com/denstorti)

## Francisco Collet

- Linkedin: [https://www.linkedin.com/in/fcollet/](https://www.linkedin.com/in/fcollet/)

# Sponsors

## ITBR Australia Community
[www.itbr.com.au](https://www.itbr.com.au)

## Contino
[https://www.contino.io](https://www.contino.io/)
