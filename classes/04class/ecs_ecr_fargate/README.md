# Introduction to Amazon ECS, ECR and AWS Fargate

This class is an introduction to the managed services ECS, ECR and Fargate, which help to orchestrate, execute and store containers.

**Contents**
- [Introduction to Amazon ECS, ECR and AWS Fargate](#introduction-to-amazon-ecs-ecr-and-aws-fargate)
- [ECS](#ecs)
  - [What's ECS](#whats-ecs)
  - [ECS Main Use Cases](#ecs-main-use-cases)
  - [Concepts](#concepts)
    - [ECS Task](#ecs-task)
    - [ECS Cluster](#ecs-cluster)
    - [ECS Service](#ecs-service)
  - [CLIs](#clis)
    - [ECS CLI](#ecs-cli)
    - [Copilot CLI](#copilot-cli)
- [ECR](#ecr)
  - [What's ECR](#whats-ecr)
  - [ECR Main Use Cases](#ecr-main-use-cases)
- [Fargate](#fargate)
  - [What's Fargate](#whats-fargate)
  - [Fargate Spot](#fargate-spot)
  - [Fargate Main Use Cases](#fargate-main-use-cases)
- [Deploying](#deploying)
  - [CDK](#cdk)
    - [What's CDK](#whats-cdk)
    - [Deploying ECS with CDK](#deploying-ecs-with-cdk)
  - [Terraform](#terraform)
    - [Deploying ECS with Terraform](#deploying-ecs-with-terraform)

# ECS

Parts of the tutorial below have been extracted from [Amazon Elastic Container Service Developer Guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-dg.pdf#Welcome)

## What's ECS

Amazon Elastic Container Service (Amazon ECS) is a highly scalable, fast, container management service that makes it easy to run, stop, and manage Docker containers on a cluster. You can host your cluster on a serverless infrastructure that is managed by Amazon ECS by launching your services or tasks using the **[Fargate](#fargate)** launch type. For more control over your infrastructure, you can host your tasks on a cluster of **Amazon Elastic Compute Cloud (Amazon EC2)** instances that you manage by using the EC2 launch type.

Amazon ECS lets you launch and stop container-based applications with simple [API calls](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/Welcome.html). You can also get the state of your cluster from a centralized service and access many familiar Amazon EC2 features.

![ECS](assets/ecs-general.png)

## ECS Main Use Cases
The are 3 common use cases for ECS.

1. `Microservices` are built with a software architectural method that decomposes complex applications into smaller, independent services. Containers are optimal for running small, decoupled services.

2. `Batch Jobs`, docker containers are particularly suited for batch job workloads. Batch jobs are often short-lived and embarrassingly parallel. You can package your batch processing application into a Docker image so that you can deploy it anywhere, such as in an Amazon ECS task.

3. `Machine Learning`, another important use case for ECS is the ability to deploy custom ML environments that run consistently in different environments. [AWS Deep Learning Containers](https://aws.amazon.com/machine-learning/containers/) provides pre-packaged docker images with the required frameworks. E.g. TensorFlow and PyTorch

## Concepts

### ECS Task

To prepare your application to run on Amazon ECS, you create a task definition. The task definition is a text file, in JSON format, that describes one or more containers, up to a maximum of ten, that form your application. It can be thought of as a blueprint for your application. Task definitions specify various parameters for your application. Examples of task definition parameters include which containers to use, which launch type to use, which ports should be opened for your application, and what data volumes should be used with the containers in the task. The specific parameters available for the task definition depend on which launch type you are using. 

The following is an example of a task definition containing a single container that runs an NGINX web server using the Fargate launch type. [Click here](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/example_task_definitions.html) for a more extended example demonstrating the use of multiple containers in a task definition.


    {
        "family": "webserver",
        "containerDefinitions": [
            {
                "name": "web",
                "image": "nginx",
                "memory": "100",
                "cpu": "99"
            },
        ],
        "requiresCompatibilities": [
            "FARGATE"
        ],
        "networkMode": "awsvpc",
        "memory": "512",
        "cpu": "256",
    }

In addition, the ECS Task can also be created using the console, which generates the JSON above.

The screenshots below show some steps when the console is used to create the task.

*ECS Launch Type*
![ECS Launch Type](assets/ecs-launch-type.png)

*Container size and the docker image*
![ECS Container and Size](assets/ecs-container-size.png)

### ECS Cluster

When you run tasks using Amazon ECS, you place them on a cluster, which is a logical grouping of resources. When you use the Fargate launch type with tasks within your cluster, Amazon ECS manages your cluster resources. When you use the EC2 launch type, your clusters are a group of container instances that you manage. An Amazon ECS container instance is an Amazon EC2 instance that is running the Amazon ECS container agent. Amazon ECS downloads your container images from a registry that you specify, and runs those images within your cluster.

![ECS View](assets/ecs-cluster.png)

*[Reference: Deploy dockerized services on AWS ECS cluster using cloudformation.](https://medium.com/@anupam.ncsu/deploy-dockerized-services-on-aws-ecs-cluster-using-cloudformation-9d6f9a703805)*


### ECS Service

An Amazon ECS service enables you to run and maintain a specified number of instances of a task definition simultaneously in an Amazon ECS cluster. If any of your tasks should fail or stop for any reason, the Amazon ECS service scheduler launches another instance of your task definition to replace it in order to maintain the desired number of tasks in the service.

In addition to maintaining the desired number of tasks in your service, you can optionally run your service behind a load balancer. The load balancer distributes traffic across the tasks that are associated with the service.

![ECS Service](assets/ecs-service.png)

## CLIs
### ECS CLI

The Amazon Elastic Container Service (Amazon ECS) command line interface (CLI) provides high-level commands to simplify creating, updating, and monitoring clusters and tasks from a local development environment. The Amazon ECS CLI supports Docker Compose files, a popular open-source specification for defining and running multi-container applications. Use the ECS CLI as part of your everyday development and testing cycle as an alternative to the AWS Management Console.

Follow the steps below to create an ECS Cluster with a Fargate Task using the ECS and AWS CLI. For this test only, ensure that the AWS profile loaded on the command line has full permission for the IAM and ECS services.

Before you start, ensure that you are inside the folder `labs/`.

Lastly, the commands below uses variable in order to demonstrate how to add these lines to a pipeline.

**1. Create the task execution role using the AWS CLI.**

*If you have already created the ECS task role in your account, you may skip the steps 1 and 2*

    aws iam --region ap-southeast-2 create-role --role-name ecsTaskExecutionRole --assume-role-policy-document file://task-execution-assume-role.json

**2. Attache the `AmazonECSTaskExecutionRolePolicy` policy to the role created above**

    aws iam --region ap-southeast-2 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

**3. Create a cluster configuration, which defines the AWS region to use, resource creation prefixes, and the cluster name to use with the Amazon ECS CLI:**

    ecs-cli configure --cluster tutorial --default-launch-type FARGATE --config-name tutorial --region ap-southeast-2

**4. Create an Amazon ECS cluster with the ecs-cli up command. Because you specified Fargate as your default launch type in the cluster configuration, this command creates an empty cluster and a VPC configured with two public subnets.**

    ecs-cli up --cluster-config tutorial --region ap-southeast-2

Cloudformation used to set up the environment

![CF](assets/ecs-cli-cloudformation.png)

**5. The command `ecs-cli up` creates a cloudformation that provisioned a VPC and two subnet for your ECS Cluster. Use the command below to export the generated VPC ID to a variable that will be used later in these steps.**

    VPC_ID=$(aws cloudformation describe-stack-resources --stack-name amazon-ecs-cli-setup-tutorial --logical-resource-id Vpc --region ap-southeast-2 --query 'StackResources[].PhysicalResourceId' --output text)

**6. Retrieve the default Security Group ID from the VPC retrieved above.**

    SG_GROUP_ID=$(aws ec2 describe-security-groups --filters Name=vpc-id,Values=$VPC_ID Name=description,Values="default VPC security group" --region ap-southeast-2 --query 'SecurityGroups[].GroupId' --output text)

**7. Using AWS CLI, add a security group rule to allow inbound access on port 80 as it is required for the container used during this test.**

    aws ec2 authorize-security-group-ingress --group-id $SG_GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0 --region ap-southeast-2

**8. Collect the subnets ids to update the `ecs-params.yml`**

    SUBNET1=$(aws cloudformation describe-stack-resources --stack-name amazon-ecs-cli-setup-tutorial --logical-resource-id PubSubnetAz1 --region ap-southeast-2 --query 'StackResources[].PhysicalResourceId' --output text)

    SUBNET2=$(aws cloudformation describe-stack-resources --stack-name amazon-ecs-cli-setup-tutorial --logical-resource-id PubSubnetAz2 --region ap-southeast-2 --query 'StackResources[].PhysicalResourceId' --output text)

**9. Update the file `ecs-params.yml` with the subnets and security group.**

When using the ecs-cli compose or ecs-cli compose service commands to manage your Amazon ECS tasks and services, there are certain fields in an Amazon ECS task definition that do not correspond to fields in a Docker compose file. You can specify those values using an ECS parameters file with the --ecs-params flag. By default, the command looks for an ECS parameters file in the current directory named ecs-params.yml. 

    sed -i "s/subnet ID 1/$SUBNET1/g"  ecs-params.yml

    sed -i "s/subnet ID 2/$SUBNET2/g"  ecs-params.yml

    sed -i "s/security group ID/$SG_GROUP_ID/g" ecs-params.yml

**10. Deploy the Compose File to a Cluster.**

The folder labs also contain the `docker-compose.yml`, which uses a docker image for testing when you run the `ecs-cli compose service up`. By default, the command looks for files called docker-compose.yml and ecs-params.yml in the current directory; you can specify a different docker compose file with the --file option..

    ecs-cli compose --project-name tutorial service up --create-log-groups --cluster-config tutorial 

![Cluster](assets/ecs-cli-cluster.png)

**11. View the Running Containers on a Cluster.**

    ecs-cli compose --project-name tutorial service ps --cluster-config tutorial

In the above example, you can see the web container from your compose file, and also the IP address and port of the web server. If you point your web browser at that address, you should see the PHP web application. Also in the output is the task-id value for the container. Copy the task ID as you use it in the next step.

**12. View the Container Logs.**

Replace the TASK_ID with the id from the previous command.

    ecs-cli logs --task-id `TASK_ID` --follow --cluster-config tutorial

The --follow option tells the Amazon ECS CLI to continuously poll for logs.

**13. Scale the Tasks on the Cluster.**

You can scale up your task count to increase the number of instances of your application with ecs-cli compose service scale. In this example, the running count of the application is increased to two.

    ecs-cli compose --project-name tutorial service scale 2 --cluster-config tutorial 

Now you should see two more containers in your cluster:

    ecs-cli compose --project-name tutorial service ps --cluster-config tutorial

In addition, you can see the new task being provisioned as shown in the screenshot below

![Scaling](assets/ecs-cli-scale.png)

**14. View your Web Application.**

Enter the IP address for the task in your web browser and you should see a webpage that displays the Simple PHP App web application.

![Website](assets/ecs-cli-site.png)

**15. Clean Up.**

When you are done with this tutorial, you should clean up your resources so they do not incur any more charges. First, delete the service so that it stops the existing containers and does not try to run any more tasks.

    ecs-cli compose --project-name tutorial service down --cluster-config tutorial

Now, take down your cluster, which cleans up the resources that you created earlier with ecs-cli up.

    ecs-cli down --force --cluster-config tutorial --ecs-profile

Reference:
- [Docker Composer](https://docs.docker.com/compose/)
- [How to Install ECS Cli](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI_installation.html)

### Copilot CLI

# ECR
## What's ECR

## ECR Main Use Cases

# Fargate
## What's Fargate
## Fargate Spot
## Fargate Main Use Cases

# Deploying
## CDK
### What's CDK
### Deploying ECS with CDK
## Terraform
### Deploying ECS with Terraform
