# Project 2 - Application migration to serverless architecture on AWS

(to be released on class 5)

## Description

You and your team were contracted again because of the good reference received with the migration project (yay!), but now this new customer has made just a PoC (proof of concept) of a revolutionary To Do List app and he want your team to lead the DevOps engineering and operation, deploying in AWS a solution able to scale to 100 thousand customers per day!

This application needs to be resilient (failure tolerant), high scalable and high available.

Besides that it is imperative that the costs are kept as low as possible if no one is using the platform.

One more thing, the CEO wants to extend this revolutionary To Do app in the future, so he wants the best practices of development, with testing, fast feedback on integration and consistent deployments.

This is the architecture of the application:

![](application/docs/pythonflask.png)


User interface:

![](application/docs/todo_ss.png)


## Task

- Infer requirements from the description and offer a solution (tip: go serverless)
	- How can you receive fast feedback when developing and integrating with other features?
	- How can you guarantee the artefact tested is the same being deployed to production?
	- How can you design a solution that "scale to 0", be high available and scalable?
	- What type of tests you could automate in this solution?
	- How can you implement security in this solution?
- Implement the solution
- Showcase to the stakeholders

### Project team: 4 people

## Assumptions
- Single Github repo.

## Grading
- Planning & team work (planning, agile practices, Pull requests review, kanban board) - 25%
- Presentation - 10%
- Documentation (READMEs, solution diagram, etc) - 15%
- Technical solution working - 50%

## Kick off
- Project introduction
- Decide on teams
- Create channel in Slack with name (project_1_name1_name2_name3)
- Create Github repo
- Create `Github project` kanban board and share 

## Resources
- [Source code for the API](application/api/)
- [Source code for the user interface](application/web/)

## Suggested technologies:
- VCS → Github
- Compute - Lambda functions 
- Data storage - DynamoDB
- Front end storage - S3
- CDN → Cloudfront
- Infra as Code → Cloudformation, Terraform
- Pipeline tool → CodePipeline, Github actions, CircleCI, TravisCI
- Containerization → Docker / Docker-compose

## Suggested timeline:
- Week 0:
  - Breakdown Stories and finish this timeline (planning). Add tasks in Trello and start working on the solution

## Credits:
- [Todo list tutorial](https://medium.com/@pamit/todo-list-building-a-react-app-with-rails-api-7a3027907665)
