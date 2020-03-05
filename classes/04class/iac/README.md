# Infrastructure as Code (IaC)

This class is an introduction Infrastructure as Code (IaC).
The main goal is to explain the purpose, the benefits and how to use it.
In this class, we'll be using Terraform as the main tool to provision resources in AWS through code.

***Contents***

- [What is a IaC?](#what-is-iac)
  - [Benefits of IaC](#benefits-of-iac)
  - [IaC Models](#iac-models)
  - [IaC Methos](#iac-methods)
- [Terraform Foundation](#terraform-introduction)
  - [Terraform Providers](#terrform-providers)
  - [Terraform State](#terraform-state)
- [Terraform Client](#terraform-client)
 - [Terraform Resources](#terraform-resources)
 - [The Power of Input Variables](#the-power-of-input-variables)

## What is IaC?
Infrastructure as Code (IaC) is the process of create, configure and manage IT resources through machine-readable file. Instead of manually creating and configuring IT resources, it's possible to have everything created in an automated and repeatable way.

IaC won't replace physical installation (racking and cabling equipments, for example), but it can be used for most of the task executed after that.

As an example, all the configuration that was executed to create the VPC, subnets, routing tables during exercises from class 2 or even configuring ECS during exercises in class 3 could be coded.

With all those manual steps in a code format, it would be possible to create those resources multiple in a matter of minutes, instead of going into multiple clicks in the AWS console.

### Benefits of IaC
The benefits of IaC are normally around three pillars:

#### Cost
Repeatable tasks that are transformed into code can reduce costs. Instead of spending 2hours creating an environment manually that needs to be created weekly, though code, that environment can take less than 5 minutes, so you're not only reducing the cost to deliver that environment, but the engineer delivering it will be able to focus on more critical things for the company

#### Speed
IaC will make the resources available faster, enabling developers to start working sooner. Specially for environments with several changes or with fast innovation pace, where new environments need to be created frequently, IaC can enable this fast pace.

#### Risk
Because everything is defined through code, you can ensure that no manual mistake can be done during any of the configuration, as well as you'll know exactly what is running on your environment, considering that deployments are only made through code and no manual changes are possible.

Decreasing the possibility of manual mistakes, you increase the availability and reliability of your environment and decrease your application downtime.

### IaC Models
There are multiple models of IaC and the two main models are Imperative and Declarative. The easier way to understand the different between those two models would be that declarative focus on what and imperative focus on how.

In other words, in the declarative model, you just define what is the desire state and the system will execute the necessary steps to achieve that state. In the imperative model, you need to define what steps needs to be executed as well as the order, so the machine knows exaclty what it needs to do to achive the desired state.

### IaC Methods
There are two methods in IaC. Push and Pull. The difference is mainly who starts the communication between the tool and the resource.

In the pull method, the resource being managed by the IaC tool will pull the tool to check if there is any change in the desired state. If any new state definition is found in the IaC tool, the resource will converge to the desired state(either through imperative or declarative models, depending on the tool).

In the push metho, the resource being managed stays in a `sleep mode` and the communication is initiated by the IaC tool. In that case, the tool will push the desired state to the resource being managed and the resource will converge to the desired state (again, either through imperative or declarative model).

## Terraform Foundation
[Terraform](https://www.terraform.io/) is one of the main IaC tools available and it uses a Decalative model with a push method. It can be used to manage resources in multiple cloud providers(including AWS, Azure and GCP) as well as manage resources in on-premisses(like in VMware and Openshift).

It's an extremly powerfull tool that can be used to create maintain and delete entire IT environments. During this material we'll focus on how to use Terraform to manage AWS resources.

### Terraform Providers
[Terraform Providers](https://www.terraform.io/docs/providers/index.html) are plugins for Terraform that makes a collection of related resources available. A provider plugin is responsible for understanding API interactions with some kind of service and exposing resources based on that API.

For example an AWS provider will enable terraform to create resources in AWS.

There are multiple Terraform Providers available and anyone can create a provider for anything they need. Here is a list of all [Providers](https://www.terraform.io/docs/providers/index.html) provided by Terraform as well as some other [Providers](https://www.terraform.io/docs/providers/type/community-index.html) provided by the community.

During the terraform code that you'll create to deploy the resources, for example, in AWS, you'll need to inform which provider should be used, the version of that provider and the region where te code will be executed. Each Provider require a different set of key/values to work properly.

```terraform
# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-2"
}

# Create a VPC named devopsacademy-vpc
resource "aws_vpc" "devopsacademy_vpc" {
  cidr_block = "192.168.50.0.0/16"

  tags = {
    Name = "devopsacademy-vpc"
  }
}
```

### Terraform State
In order to be able to create, change, delete and keep track of current state of the resources being managed by itself, Terraform make uses of a file called `Terraform State`, which is used to store state about your managed infrastructure and configuration.

This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is, by default, stored in a local file named "terraform.tfstate", but it can also be stored remotely in places like S3 or similar services from other cloud providers.

With this file, Terraform can, whenever you deploy new code to your environment, inform of which resources are being added, changed or deleted, so you can make sure that the new code is executing exaclty what you expect.

In order to specify where the Terraform State will be stored, we use the `backend` code, as the example below:

```terraform
# Define where the terraform state will be stored
terraform {
  backend "local" {
    path = "/devopsacademy/critical/terraform.tfstate"
  }
}
```
If, for any reason, the state file is lost, terraform wont be able to know the resources that are managed by it, and you'll need to rely on the [import feature](https://www.terraform.io/docs/import/index.html) to try to recover the existent state, but this is a very manual and ardue task, so make sure you keep your state file safe.


More details around the Terraform State can be found [here](https://www.terraform.io/docs/state/index.html).

## Terraform Client
The Terraform is only a single command-line application. From that you have subcommands to interact with the Terraform code that you have in your working directory. [Here](https://www.terraform.io/docs/commands/index.html) is a full list of the options available for the terraform application, but below you have some of the most common commands used.

- terraform init
    - Initialize a working directory containing Terraform configuration files. This would be the first command you run after creating your code. [Details for this command](https://www.terraform.io/docs/commands/init.html)
- terraform plan
    - Performs a refresh and determines what actions are necessary to achieve the desired state specified in the configuration files.
- terraform apply
    - Apply the changes required to reach the desired state of the configuration, or the pre-determined set of actions generated by a terraform plan execution plan
- terraform destroy
    - Destroy the Terraform-managed infrastructure

## Terraform Resources
Resources are the most important component of a Terraform code. Each resource block represents an object in the infrastructure that will be created and managed by Terraform.

The resource block defines all the characteristics and configuration of the resource, and each resource type will have different required and optional arguments.

```terraform
# Define a new resource of the EC2 instace type
resource "aws_instance" "da_academy" {
  ami               = "ami-077007384e83bf4cc"
  availability_zone = "ap-southeast2-2a"
  instance_type     = "t1.micro"

  tags = {
    Name = "DevOpsAcademy-Instance"
  }
}
```
In the example above, an EC2 Instance named `DevOpsAcademy-Instance` would be created. In this resource we have also identified the AMI that needs to be used, the instance type and the Availability Zone that the instance should be created into. Many more optional Arguments could be added to this resource, like `key_name`, `subnet_id`, `security_group`, and many others. A list of all Argument options for EC2 can be found [here](https://www.terraform.io/docs/providers/aws/r/instance.html).

Each resource block declares a resource type and the resource name. In the example above, the instance type is `aws_instance` and the resource name is `da_academy`.

This name defined by you have no importance outside of the Terraform scope, so it won't affect any configuration of the resource being created in AWS, in our case.

The name is important to be referenced by another resource being created in the same Terraform code.

```terraform
# Define a new resource of the EC2 instace type
resource "aws_instance" "da_academy" {
  ami               = "ami-077007384e83bf4cc"
  availability_zone = "ap-southeast2-a"
  instance_type     = "t1.micro"

  tags = {
    Name = "DevOpsAcademy-Instance"
  }
}

# Define a new resource of the EIP type
resource "aws_eip" "da_academy" {
  vpc = true
}

# Associate an EC2 instance resource with a EIP resource
resource "aws_eip_association" "da_academy" {
  instance_id   = "${aws_instance.da_academy.id}"
  allocation_id = "${aws_eip.da_academy.id}"
}
```

In the example above, we're using the same EC2 instance creation code, but we're adding 2 new resources to it. One of them is the resource type `aws_eip`, which creates a new Elastic IP. The other new resource is a `aws_eip_association`, which we're using to associate the EIP named `da_academy` to the EC2 instance named `da_academy`.

Keep in mind that the full name of a resource(composed by the resource type + the name of the resource) must be unique in your Terraform code.

Note that for the resource reference, there is one additional component to the names we're referencing. For example, when we are referencing the EC2 instance in the EIP association resource, we're using `aws_instance.da_academy.id`.

The `aws_instance.da_academy` we already know that represents the unique name of that particular resource, however the additional `id` part of the reference we've used is new to us.

Each resource, when created, have a list of `Attributes`, that, just like the list of Arguments, is different for each type or resource.

In the case of the EC2 instance, the ID represents the Instance ID of a instance. EC2 instances have other Attributes when created, such as `arn`, `public_ip`, `private_ip`, `public_dns` and many more.

As you can image, it's important to know all Arguments and Attributes of each resource available on th AWS provider, but there is a great documentation, about each resource on the [Terraform AWS provider page](https://www.terraform.io/docs/providers/aws/index.html).

When creating any Terraform code, consider the Provider documentation page your best friend. No one creating Terraform code lives without it.

## The Power of Input Variables

Having your entire infrastructure as code with Terraform is very useful, so you can have a single source of true for your environment as well as enables you to keep a good control over the changes that happens in your environment.

To make IaC even more powerful, we can use variables in our code that will be used to create our resources. Inoput Variables serve as parameters for a Terraform code, allowing aspects of the code to be customized without altering the source code, and allowing code to be shared between different configurations.

This enables the reuse of code, so if you want to create 10 similar resources or group of resources, you only need to change the variables that will be used to create those resources.

```terraform
# Define variables
variable "instance_type" {
  type = string
}
# Define a new resource of the EC2 instace type
resource "aws_instance" "da_academy" {
  ami               = "ami-077007384e83bf4cc"
  availability_zone = "ap-southeast2-a"
  instance_type     = var.instance_type

  tags = {
    Name = "DevOpsAcademy-Instance"
  }
}
```
In the case above, the InstanceType argument of the AWS Instance Resource can be informed during the execution of the code, allowing us to reuse this piece of code for multiple instances, without having to change the code.
