# Class 02

## Agenda

 - [Agile 101](/classes/02class/agile101/README.md)
 - AWS Services - Part I

### Exercise
- 3 groups of 4 people
- What have you learned last class?
- What whas interesting about last class?
- Anything that you didn't understand last class?


## AWS Services - Part I

### IAM

### VPC + Subnets

*WIP*

### EC2

*WIP*

### Auto-Scaling

*WIP*

### Load Balancers

*WIP*

### Route53

*WIP*

### S3

*WIP*

### RDS

*WIP*

### DynamoDB

*WIP*

### Lambda

*WIP*

## Labs and Exercises

### VPC and EC2s
- Build a new VPC, 3 subnets, NATGW, IGW, routes, nacls	6
- Launch EC2 t2.micro on private and jumpbox on public, ssh to to private through jumpbox

### Load Balancer and Autoscaling groups
- Create an auto scaling group that will run 2 EC2 instances running Appache Server(each index.html will show the server name)
- Create a load balancer in front of those EC2 instances
- Confirm that the load balancer is sending requests to both servers
