# Getting ready to start

- [Join Slack](#join-slack)
- [GitHub Account](#github-account-and-ssh-key-added)
  - [Challenge01](#challenge-01)
- [Amazon AWS account](#amazon-aws-account)
  - [Challenge02](#challenge-02)
  - [Challenge03](#challenge-03)
- [AWS command-line tool](#aws-command-line-tool)
  - [Challenge04](#challenge-04)
- [Visual Studio Code](#visual-studio-code)
  - [Challenge05](#challenge-05)
- [Terraform command-line tool](#terraform-command-line-tool)
- [Docker command-line tool](#docker-command-line-tool)
- []()


## join slack

Slack will be used as the main real-time communication tool. While all the feedback of your work will be available through GitHub, chatting with the community and getting quick tips will be done via slack.
 
- Join clicking on the link below:
 
https://join.slack.com/t/devopsacademyau/shared_invite/enQtODI2NzE5OTYxNDExLTE5YzRjNjFiYWI2OTY2OWY4YzM5OTc3NjBjY2Y3NjQwYzM5MzJjZDUwNWQ4MGQ4ODEwNDUzNjlkZDhkYjEyZDY
 
## GitHub account and SSH key added

To access the academy content and to share your work, you will need a GitHub account. More information on how to use GIT is available on the first [class](../01class/README.md). For now, just make sure you create your GitHub account and if you can, generate an SSH key on your laptop and add it to your GH account.
 
- Create an account: https://github.com/join
- Generate an SSH key: https://help.github.com/en/enterprise/2.16/user/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- Add the SSH key to your GH account: https://help.github.com/en/enterprise/2.16/user/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
 
### Challenge 01:

Clone our DA repository using the SSH method. The SSH method should always be the preferred method for clone/pull/push as it won't require username/password to be typed every time. 
 
## Amazon AWS account

The cloud provider chosen for the DA is AWS. So to complete the course is required that the students have their own AWS account to run the exercises. Although AWS offers a 12-month free tier where you can run most of their services on a limited way for free, it is important to mention that you will be required to provide a credit card upon creation of your account.
 
Using your account without knowing what you are doing can potentially generate high costs, so please always read the documentation carefully and/or ask before proceeding.
 
PS.: AWS can potentially refund some costs getting in touch with them through the support but let's not count on that.
 
- Create your AWS account: https://aws.amazon.com/free/start-your-free-trial/
 
### Challenge 02:

It's best practice not to use the root account (email/password used to create) to operate your AWS environment. Create a user account, add MFA to it and log in as you recently created user.
 
### Challenge 03:

As mentioned before, if you don't know what you are doing, you can potentially go over your AWS free trial and incur some costs. AWS offer ways to create billing alerts based on thresholds. Try to create a billing alert if your bill goes over the free tier or something like $5-$10.
 
## AWS command-line tool

All the interaction with the AWS environment is done either through the console or its API. Whereas will be doing lots of tasks on AWS console so you can see what is happening, to automate things, the API needs to be used. For that, you can either use the command-line tool (cli) or programming language SDK's.
 
- Install AWS cli: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
 
### Challenge 04:

To execute any commands with the cli, you will need to be authenticated to your AWS account. Find out how to generate AWS access keys and test some basic commands to make sure you are authenticated.
 
- shows what user is authenticated: aws sts get-caller-identity
- list your buckets: aws s3 ls
 
## Visual Studio Code

Although you can use any IDE (Integrated Development Environment), we highly recommend VS Code for its simplicity and compatibility with a broad range of tools and languages.
 
VS Code is basically a notepad on steroids. With many plugins, features and shortcuts it's an easy choice for your primary file editor.
 
- Install VS Code: 
 
### Challenge 05: 

Install any other plugin/extensions that you find interesting. We recommend docker, terraform, indent-rainbow, settings sync, terminal-tabs. You can also configure your operating system to have the VSCode installation folder on the PATH, so you can easily open files from your terminal only typing "code myfile.txt" or whole folders "code /devopsacademy"
 
## Terraform command-line tool

Terraform cli also uses AWS API to create/edit/delete resources based on code. This is one of the main domain syntax languages (DSL) used for infrastructure-as-code (one of the topics of the course). For now, we just need you to have the cli installed and configured.
 
- Install Terraform cli: https://learn.hashicorp.com/terraform/getting-started/install.html
 
## Docker command-line tool

Docker solves long known issues like "works on my machine!" packaging the application code and all its requirements in an image. It is very similar to virtual machines without the need to use a full Operating System for each instance of the application. You will learn Docker more in-depth during the course.
 
- Install Docker cli: https://docs.docker.com/install/
