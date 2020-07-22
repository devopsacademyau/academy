# Project 1 - Running wordpress in AWS

(to be released on class 4)

## Description
A company in Australia currently have a web application running on a Linux virtual machine.
The application is being used by hundreds of customers every day and it is based on Wordpress which uses LAMP stack (Linux, Apache, MySQL and PHP) to offer great products.

Currently the solution is hosted in a single server (application and database) and deployments are made through FTP transfers to the server.

The CEO is worried that a traffic peak may bring down the website and decided to migrate to AWS. Your team was contracted to perform this migration (congrats!).

<p style="text-align: center;">
  <img src="https://www.themely.com/wp-content/uploads/2018/12/MySQL-WebServer-1.jpg"/>
</p>
<p style="text-align: center;">
  1. Wordpress simple flow [1]
</p>

## Task
### Project Team: 4 people

Your team needs to run a pilot migration to AWS cloud considering the following requirements:
- Containerize the application using Docker (see Resources section).
- The application needs to be secure (all data encrypted at rest and in transit)
- The application needs to be high available.
- The application needs to support peaks of up to 10 times the average load (scalability).
- The infrastructure needs to be reproducible and version controlled in case the CEO decides to expand the business to other parts of the world (consider infra as code).
- There must be an easy and secure way of developing, with fast feedback  (consider CI/CD practices or at least automation scripts)

Your team will need to present a 10-min demo of the solution + 10 min questions to the board in 4 weeks, they want to see:
- A solution diagram containing all the components of the solution and explaining the data flow. Expect basic questions about the architecture and technologies chosen.
- How the developer life will be better? Easy deployments, fast feedback?
- How will you monitor the health of the system?
- How the system handle failure of some components?
- List improvements to be made or features not delivered in this phase

## Assumptions
- As it is a pilot migration to AWS, data migration is out of scope
- Testers were contracted to develop unit/service/integration tests for this pipeline, so you don't need to write tests but consider including this step in your CI pipeline or automation scripts!
- Consider the application as stateless for this pilot. In Wordpress some files may be stored locally on the server (e.g. on image upload)
- For this pilot we are aiming to have as much as possible as code
- Single Github repo.

## Grading
- Planning & team work (planning, agile practices, Pull requests review, Trello board) - 25%
- Presentation - 10%
- Documentation (READMEs, solution diagram, etc) - 15%
- Technical solution working - 50%


## Kick off
- Project introduction
- Decide on teams
- Create channel in Slack with name (project_1_name1_name2_name3)
- Create Github repo
- Create `Github project` board and share 

## Resources
- Source code of the wordpress application (Github)
- Use Slack channel for communication and questions to teachers
- Special readings for you:
  - https://aws.amazon.com/blogs/architecture/wordpress-best-practices-on-aws/
  - https://medium.com/@beBrllnt/from-30-minutes-to-10-seconds-automating-wordpress-setup-5ff7526942c0


## Suggested technologies:
- VCS → Github
- Infra as Code → Terraform
- Pipeline tool → Github actions
- Containerization → Docker / Docker-compose
- Relational Database → RDS MySQL
- Container orchestrator → ECS

## Suggested timeline:
- Week 0:
  - Breakdown Stories (planning) in Trello and start working
- Week 1:
  - Containerize application using Docker
  - Start CI pipeline / automation scripts
- Week 2 (class 5):
  - Infrastructure as code working
- Week 3:
  - Application deployed to AWS using pipeline/scripts successfully
  - Start presentation material and refine documentation (double check if you're attending all requirements)
- Week 4 (class 6):
  - Presentation (demo)

## Credits: 
[1] https://www.themely.com/how-to-fix-error-establishing-a-database-connection-in-wordpress/mysql-webserver-1/