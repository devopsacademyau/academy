# DevOps Academy

<p align="center">
    <img src="docs/logo.png" width="300">
</p>

This non-profit repository intention is to help the community to learn the DevOps methodology and culture throughout a series of classes and hands-on laboratories based on Amazon Web Services (AWS) and become ready to start working as Automation/Cloud/DevOps Engineer.

Feel free to contribute with content (PR), help peer reviewing code or just going through the exercises!

If you want to make part of the team behind this, get in touch on help@devopsacademy.com.au.


# in-person classes

The academy content will also be shared through some free in-person classes in Melbourne/Australia for a limited number of participants.

If you live in Melbourne and are interested in participate, [please read this documentation](in-person.md).

Expression of interest registration is open from the 21/11 to 30/11.

# Table of Content

- [How it Works](#how-it-works)
- [Content](#content)
    - [Classes](#classes)
    - [Labs](#labs)
    - [Projects](#projects)
- [Authors](#authors)
    - [Caio Trevisan](#caio-trevisan)
    - [Denis Storti](#denis-storti)
    - [Francisco Collet](#francisco-collet)
- [Sponsors](#sponsors)
    - [ITBR Australia](#itbr-australia)
    - [Contino](https://contino.io)


# How it Works

The DevOps Academy consists in 8 hands-on exercises (6 laboratories + 2 projects) + at least 3 peer review contributions to other members code. 

To participate, you will need to:

- fork this repository to your own github account
- clone the forked repository to your computer

```bash
git clone <repo-url>
```

- create a folder with your `github username` (e.g. `denstorti`, `kikobr82`, ...)

```bash
cd <repo-name>
mkdir labs/lab01/<my-name>
```

- add your code, create a commit with the change and push it

```bash
cd labs/lab01/<my-name>
touch newfile

# commit and push
git add newfile
git commit -m "adding a new file"
git push
```

- create a `pull request` from your forked repository back to this one
- wait until you get at least two review approvals, one being from the maintainers
- you complete the exercise once your code is merged to this repository

Upon completion of your first exercise, you will be given permission to start/help peer reviewing other community members code! 

# Requirements

- [Github Account](https://github.com/join)
- [AWS Account](https://aws.amazon.com/free/start-your-free-trial/)
- [AWS cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- [Terraform cli](https://learn.hashicorp.com/terraform/getting-started/install.html) 
- [Visual Studio Code (VS Code)](https://code.visualstudio.com/download)

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

- [Class 01 - GIT and AWS introduction](classes/class01/README.md)

## Labs

- [Lab 01 - EC2 + EBS](labs/lab01/README.md)

## Projects

- [Project 01 - Application migration from on-prem to the cloud](projects/project01/README.md)
- [Project 02 - Cloud native application architecture on AWS](projects/project02/README.md)

# Contributors and Instructors

### Presentation format
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

> ### ITBR Australia Community
> [www.itbr.com.au](https://www.itbr.com.au)

> ### Contino (In class course, Feb 2020)
> [https://www.contino.io](https://www.contino.io/)
