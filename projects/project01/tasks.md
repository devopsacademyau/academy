# project 1 steps

- all cards to be considered completed needs to have developed code and proper documentation commited to master branch


## Network stack
  - vpc (/16 cidr)
  - 4 subnets (/24 cidr) public/private in 2 different AZ'stack
  - 2 route table public/private
  - 2 nacl public/private (ALLOW ALL is not permitted)
  - internet gateway

done:
  - I can run a instance on public subnet and another one on private subnet
  - I can access the public one using ssh from my local machine through internet
  - I can't directly access the private instance from internet
  - I can ssh the private instance from the public one
  - no security groups or nacls have `ALLOW ALL`


## ECR repository
  - create a custom ECR repository for hosting custom wordpress container image
  - you can use official wordpress image but from a custom Dockerfile (i.e. FROM wordpress) - not latest though - please fix a wordpress version
  - make sure to push at least the first version of it to the new ecr

done:
  - I can push new container image tags to an ECR repository
  - I can pull images on ECR from ec2 instances running on my vpc


## Systems Manager Parameter store
  - generate 4 empty keys to store wordpress secrets
    - /wordpress/WORDPRESS_DB_HOST
    - /wordpress/WORDPRESS_DB_USER
    - /wordpress/WORDPRESS_DB_PASSWORD
    - /wordpress/WORDPRESS_DB_NAME
  - use aws managed key to encrypt values for these keys. Do it manually through AWS console
  - make sure to use same values when configuring wordpress image

done:
  - terraform code for creating 4 empty parameters
  - 4 encrypted ssm parameters store manually filled through the console


## MySQL database
  - create a RDS Aurora MySql database
  - use version `Aurora (MySQL 5.7) 2.07.2`
  - serverless version
    - smallest instance size available if you have issues with serverless
  - no need for aurora replica
  - use same username/password that you setup the systems manager parameters
  - use custom vpc from network stack
    - private subnets
    - security groups with only required permissions for instances on private subnet
  - backup just one day
  - encryption using aws managed key
  - disable performance insights
  - disable enhanced monitoring
  - no need for IAM authentication (wordpress does not support it)
  - disable deletion protection

  done:
    - from an instance on private subnet:
      - I can run a wordpress container image with aurora secrets and be able to access it
      - I CAN'T access the database from public instances
    - terraform code SHOULD NOT HAVE ANY SECRETS COMMITED


## ECS Cluster
  - ecs cluster using autoscaling group
    - 1 instance is fine for demonstration, 2 ideal
    - t2.micro should be fine (if possible)
  - use amazon linux image 2 for ecs
  - hosted on private subnets
  - any security groups needed
  - any IAM instance role needed

done:
  - I can see a cluster on AWS console with at least one instance available, ideally two instances on different AZ's
  - cluster instances should be running on private subnet
  - instances should be running Amazon Linux 2 optimised for ECS
  - any security group or IAM permissions should be very restrictive with only required permissions
  - terraform code should use VARIABLES for most of the settings


## EFS
  - use vpc from network stack
  - at least one mount target (AZ)
  - security group allowing only ECS instances to access it
  - no lifecycle policy
  - throughput mode bursting
  - performance mode general purpose
  - no need for encryption
  - no need for IAM authentication
  - add one access point:
    - name wordpress
    - path `/wordpress`

done:
  - efs is available in at least one AZ
  - I can mount efs volume on an ec2 instance running on private subnet following instructions https://docs.aws.amazon.com/efs/latest/ug/mounting-fs.html
  - I CAN'T mount efs volume from instance on public subnet


## WORDPRESS APPLICATION
  - task definition:
    - custom wordpress image from ECR
    - using efs as volume and mounting `/var/www/html` inside wordpress container for persistent storage
      - no need for IAM authentication
    - wordpress database variables coming from ssm parameter store
    - memory 128
    - any IAM execution role if needed with only required permissions
  - ecs service:
    - type EC2
    - use custom task definition for wordpress
    - service type replica
    - deployment type rolling update or blue/green (first is easier, second is better)
    - at least 2 task definitions running at any point in time
  - initialise wordpress database when first runs a container

done:
  for testing purposes:
  - run a test ecs cluster with instances running on public subnet and required security groups open
  - run service with only one task definition running exposed to port 80
  - access public ip address from ec2 instance on port 80 to reach wordpress running
  - finish wordpress installation steps to initialise database
  terraform code:
  - service needs 2 task definitions running
  - don't expose task definition to port 80 on host


## AWS Certificate Manager (ACM)
  - this task should be done on the AWS final account where the group will make the demonstration (ONLY ONCE)
  - generate a new managed certificate manually through the console:
    - request certificate (public)
    - add domain names `*.<your-group-name>.devopsacademy.com` (i.e. *.group1.devopsacademy.com.au)
    - chose DNS validation
    - send the CNAME record that needs to be created to one of the DA instructors

done:
  - no terraform code for this task in specific
  - certificate request created and validate status is `ISSUED`


## SCRIPTING
  - local automation should use 3Muskeeters pattern
  - Makefile containing at least targets for: `build` `deploy`
  - targets should call docker-compose to execute code
  - terraform state file can be managed locally individual by each student
    - if groups decide to use a shared aws account, use S3 bucket as backend to share the state
  - build:
    - build docker image
    - tag new image with commit SHORT_SHA (last 5 digits)
    - push image to ECR
  - deploy:
    - update task definition revision with new container image tag
    - update service to use new task definition
  
done:
  minimum:
    - local scripts to push new built image tag to ECR
    - task definition / service updates can be done manually on AWS console for demonstration
  good to have:
    - deployment updating TD/service via `make deploy`


## APPLICATION LOAD BALANCER
WIP

done:
  - send ALB CNAME record to one of the instructors to create a friendly name
  - add ACM certificate to ALB


## CICD
WIP

  - create a github action that:
    - every pull request will run `make build`
    - build step needs to build image and push to ECR tagged with commit SHORT_SHA for reference
  - create a github action that:
    - every push to `master` branch will run `make deploy`
    - deploy step will update task definition / service with new container image tag

done:
  minimun:
    - github action for building pull requests
  good to have:
    - github action for deploying new images when new code reaches master branch


# TIPS:
  - if your tasks have dependency from other tasks:
    - create temporary resources (even manually on the console if required)
    - use terraform variables to enter these temporary resources values from your own aws account
    - terraform code can be updated later to link with other people work
  - use your own existing network resources to build your cluster
  

If you get stuck ASK FOR HELP.

We are a team and we need 3 projects to get delivered in 2 weeks, otherwise everyone has failed.

