# Continuous Integration / Continuous Deployment

I need to add/delete changes to my running application as automated as possible.
 
***Contents***
- [Pipeline](#what-is-a-pipeline)
  - [Example](#example)
- [Continuous Integration](#what-is-continuous-integration)
- [Continuous Deployment](#what-is-continuous-deployment)
- [Creating a pipeline](#creating-a-pipeline)
  - [CICD Tools](#cicd-tools)
- [References](#references)

## What is a Pipeline?

A pipeline is a series of automated tasks (scripts) that usually gets triggered by a push to a specific branch in your source control system and automatically triggers the next stage based on the status of the previous step.

Pipelines can be used to any type of automation but are commonly associated with a software delivery process.

- How can I make sure that code coming from one or multiple developers working on the same project is safe to be deployed to a production application that is running?

### Example

![CICD](/classes/05class/cicd/assets/cicd.png)

A common pipeline will have the the following steps at minimum:

#### test
- syntax (spaces/tabs, missing commas, etc)
- linting (code formatting)
- unit tests (individual components)

*sometimes unit tests require the application to be compiled beforehand (adapt your pipeline as needed)*

#### build
- download required packages (npm install, yum install, etc)
- versionate your application using things like version number or tag with short git commit SHA (last 5 digits)
- produce artefact either:
  - compile code and generate application binary/files
  - build container and push to images repository

*it's a good practice to remove any libraries used to build the code from the final artefact to save space*

#### deployment
- deploy latest application artefact to a DEVELOPMENT stage

#### post deployments
- run integration tests 
  - test new code integrated with other existing parts
- run smoke tests
  - check new functionalities are working or bugs are fixed

#### production
- in old days it could mean a:
  - stop webserver
  - delete all files from static files folder
  - unzil latest artefact to folder
  - start webserver
- container way of doing:
  - stop running container
  - run new container tag


## What is Continuous Integration?

Easy achievable as it does not directly impact the application end-users, it normally involves all the pipeline process before the deployments.

Developers are encouraged to push code to source control several times a day to make their code go through the series of automated tests/build and constantly/quickly get feedback rather than deploying days of work and realise big mistakes were made.

Each code push will trigger the pipeline and any error/issues can be checked on loggs or are reported back via email/slack to the developer.

Pipelines usually won't allow to progress the stages in case a step fails. Administrators can override error messages if they understand what is wrong but will usually makes things worst in the next stage.


## What is Continuous Deployment?

Coming just after the CI successfuly finishing, the CD means that your application is deployable at any point in time and can be automatically deployed to test/qa/production environments if the version has passed all automated tests.

Very hard to achieve a fully automated CD. For that, a few items needs to be considered but not limited to:
  - maturity of automated testing
  - security assurance that code does not have vulnerabilities
  - regulated environments might need a check/approval before proceeding

If automated deployment to production is not possible, you can have alerts to responsible people to inform that code is ready to be deployed and as simple as a click or a reply to an email, you can get the code deployed to production.

Production deployments can use some strategies to help minimise downtime if unexpected bugs/issues are found after deployment:
- **in place**: just update current version with new artefact, rely into versioning if rollbacks are required. Cost effective, can have extended periods of downtime.
- **blue/green**: deploy new code in a separate environment where you can easily switch users back and forward to the new/old code. Expensive as requires two environments, short/none downtime in case a rollback is needed.

![blue-green](/classes/05class/cicd/assets/blue-green.png)

- **canary**: deploy new code in a separate environment and diverge just a % of your users base to the new code and gradually increments the number of it. Expensive as requires at least two environments, only a % of users are affected if code has issues.

![canary](/classes/05class/cicd/assets/canary.png)


## Creating a pipeline

As mentioned before, a pipeline is just a series of multiple scripts, often bash or powershell, that are chained with each other and expects a successfully result from the first step to continue.

All modern source control tools (git, gitlab, bitbucket) have API's that can be accessed to check whether new code has been pushed to it or not. A part from the API's where you can check code status, these tools also emmit signals every time a new code is pushed to branches, often called **webhooks requests**.

Therefore, triggers to start simple scripts or fully automated pipelines can be created around these webhooks signals.

- pulling (not recommended)
  - cron job, runs every X minutes to check if new code is available
- custom software to listen for webhooks (not recommended)
  - develop an application that will consume a webhook and will trigger the first script once new code is available
- use cicd tools available in the market

### CICD Tools

- [Jenkins](https://jenkins.io/)
Oldest and most famous open-source tool available. Requires quite a lot of effort to manage your own environment. You need to run your own instances, install software and maintain the pipelines.

- [Github Actions](https://github.com/features/actions)
Recently released, abastracts the maintainance of the flow and tasks. Requires you to launch an instance with a specific software and register it as **runner**, from that, everything is controlled through a `.yaml` file.

- [GitLab Pipelines](https://docs.gitlab.com/ee/ci/pipelines/)
Very good reputation but requires you to use GitLab as source control, abastracts the maintainance of the flow and tasks. Requires you to launch an instance with a specific software and register it as **runner**, from that, everything is controlled through a `.yaml` file. Gitlab pipelines can be used with **free/shared runners**, just bear in mind that those environments are shared with the community and the use of secrets/passwords/aws keys should be avoided at all times.

- [Circle CI](https://circleci.com/)
Fully managed paid solution, provides a free trial.

- [Buildkite](https://buildkite.com/)
Best overall fully managed paid solution in the market. It can be quite expensive to run

- [AWS CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html)
AWS feature for creating pipelines on their environment. Requires the use of other tools like CodeCommit and CodeBuild to use.

## References

- [The Phoenix Project](http://itrevolution.com/books/phoenix-project-devops-book/)
- [CI Essentials](https://codeship.com/continuous-integration-essentials)
- [Github webhooks](https://developer.github.com/webhooks/)
