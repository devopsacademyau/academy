# Class 02

## Agenda

 - Agile Introduction
 - AWS Services - Part I

## Agile Introduction

### What is it?
*WIP*

### Frameworks
*WIP*

### Scrum
*WIP*

### Kanban
*WIP*

### Ceremonies
*WIP*

### Integration with DevOps	
*WIP*

### Exercise
- 3 groups of 4 people
- What have you learned last class?
- What whas interesting about last class?
- Anything that you didn't understand last class?


## AWS Services - Part I

### VPC + Subnets

*WIP*

### EC2

*WIP*

## Labs and Exercises

(Link to exercises)[/classes/class02/exercises/README.md]

### VPC and EC2s
- Build a new VPC, 3 subnets, NATGW, IGW, routes, nacls	6
- Launch EC2 t2.micro on private and jumpbox on public, ssh to to private through jumpbox

### Load Balancer and Autoscaling groups
- Create an auto scaling group that will run 2 EC2 instances running Appache Server(each index.html will show the server name)
- Create a load balancer in front of those EC2 instances
- Confirm that the load balancer is sending requests to both servers
