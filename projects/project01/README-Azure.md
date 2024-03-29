# Project 1 - Running wordpress in Azure

- [AWS version](/projects/project01/README.md)

## Description
A company in Australia currently have a web application running on a Linux virtual machine.
The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

The CEO is worried that a traffic peak may bring down the website and decided to migrate to Azure. Your team was contracted to perform this migration (congrats!).

<p style="text-align: center;">
  <img src="https://www.themely.com/wp-content/uploads/2018/12/MySQL-WebServer-1.jpg"/>
</p>
<p style="text-align: center;">
  1. Wordpress simple flow [1]
</p>

## Task

### Project Team: 4 people

Your team needs to run a pilot migration to Azure cloud considering the following requirements:
- Containerize the application using Docker (see Resources section). Running application from VMs is also acceptable but not recommended.
- The application needs to be secure (all data encrypted at rest and in transit)
- The application needs to be high available.
- The application needs to be scalable.
- The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
- There must be an easy and secure way of developing, with fast feedback  (consider CI/CD practices or at least automation scripts)

Your team will need to present a 10-min demo of the solution + 10 min questions to the board in 4 weeks, they want to see:
- A solution diagram containing all the components of the solution and explaining the data flow. Expect basic questions about the architecture and technologies chosen.
- How the developer life will be better? Easy deployments, fast feedback?
- How will you monitor the health of the system?
- How the system handle failure of some components?
- List improvements to be made or features not delivered in this phase

## Assumptions
- As it is a pilot migration to Azure, data migration is out of scope
- Testers were contracted to develop unit/service/integration tests for this pipeline, so you don't need to write tests but consider including this step in your CI pipeline or automation scripts!
- Consider the application as stateless for this pilot. In Wordpress some files may be stored locally on the server (e.g. on image upload)
- For this pilot we are aiming to have as much as possible as code
- Single Github repo.

## Grading 

> Just for reference, not really graded

- Planning & team work (planning, agile practices, Pull requests review, Trello board) - 25%
- Presentation - 10%
- Documentation (READMEs, solution diagram, etc) - 15%
- Technical solution working - 50%

## Kick off (today!)

- Project introduction (instructors)
- Decide on teams (check with instructors)
- Create Github repo
- Create initial project backlog
- Create channel in Slack with name

## Resources

- Source code of the Wordpress application (Github)
- Use Slack channel for communication and questions to teachers
- Special readings for you:
  - [Deploy Wordpress on Azure WebApp](https://blog.matrixpost.net/deploy-wordpress-in-azure-app-service-with-staging-slots-for-the-production-and-development-environment/)
  - [Wordpress Docker image](https://hub.docker.com/_/wordpress/)
  - https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0
  - [Deploy Wordpress on AKS](https://docs.microsoft.com/en-us/azure/mysql/flexible-server/tutorial-deploy-wordpress-on-aks)


## Suggested technologies:

- VCS → Github
- Infra as Code → Terraform
- Pipeline tool → Github actions or Azure DevOps
- Containerization → Docker / Docker-compose
- Relational Database → Azure Database for Postgresql
- Assets repository → Azure Storage
- Container orchestrator → AppService or AKS
- Azure VMs

## Suggested timeline:

## Credits: 
[1] https://www.themely.com/how-to-fix-error-establishing-a-database-connection-in-wordpress/mysql-webserver-1/
