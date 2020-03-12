# Infrastructure as Code (IaC)
This class is an introduction to Infrastructure as Code (IaC).
The main goal is to explain the purpose, the benefits and how to use it.
In this class, we'll be using Terraform as the main tool to provision resources in AWS through code.

***Contents***
- [What is IaC?](#what-is-iac)
  - [Benefits of IaC](#benefits-of-iac)
  - [IaC Models](#iac-models)
  - [IaC Methods](#iac-methods)
- [Terraform Foundation](#terraform-foundation)
  - [Terraform Providers](#terrform-providers)
  - [Terraform State](#terraform-state)
- [Terraform Client](#terraform-client)
 - [Terraform Resources](#terraform-resources)
 - [The Power of Input Variables](#the-power-of-input-variables)
 - [Outputs](#outputs)
 - [File Organization](#file-organization)
 - [Running some code](#running-some-code)
 - [Extra](#extra)
  - [Modules](#modules)
 - [Appendix](#appendix)


## What is IaC?
Infrastructure as Code (IaC) is the process of create, configure and manage IT resources through machine-readable file. Instead of manually creating and configuring IT resources, it's possible to have everything created in an automated and repeatable way.

IaC won't replace physical installation (racking and cabling equipments, for example), but it can be used for most of the task executed after that.

As an example, all the configuration that was executed to create the VPC, subnets, routing tables during exercises from class 2 or even configuring ECS during exercises in class 3 could be coded.

With all those manual steps in a code format, it would be possible to create those resources multiple in a matter of minutes, instead of going into multiple clicks in the AWS console.

### Benefits of IaC
The benefits of IaC are normally around three pillars:

#### Cost
Repeatable tasks that are transformed into code can reduce costs. Instead of spending 2 hours creating an environment manually that needs to be created weekly, though code, that environment creation can take less than 5 minutes. 

With that, you're not only reducing the cost to deliver that environment, but the engineers will be able to focus on more critical things for the company.

#### Speed
IaC will make the resources available faster, enabling developers to start working sooner. Especially for environments with several changes or with fast innovation pace, where new environments need to be created frequently, IaC can enable this fast pace.

#### Risk
Because everything is defined through code, you can ensure that no manual mistake can be made during any of the configuration. Also, you'll know what is running on your environment, considering that deployments should only be made through code. Manual can be still possible, but much easier to restore the environment to a known state.

Decreasing the possibility of manual mistakes, you increase the availability and reliability of your environment and reduce your application downtime.

### IaC Models
There are multiple models of IaC, and the two main models are Imperative and Declarative. The more natural way to understand the difference between those two models would be that declarative focus on what and imperative focus on how.

In other words, in the declarative model, you define what the desired state is, and the system will execute the necessary steps to achieve that state. As an example, you can declare that you want a S3 bucket with a specific name. 

In the imperative model, you need to determine what actions need to be performed as well as the order, so the machine knows what it needs to do to achieve the desired state. Using the same example as above, in an imperative model you would need to describe the steps needed to create an S3 bucket in the console or the exact command required to create the S3 bucket through the aws cli command.

### IaC Methods
There are two methods in IaC. Push and Pull. The difference is who starts the communication between the tool and the resource.

In the pull method, the resource being managed by the IaC tool will pull the tool to check if there is any change in the desired state. If any new state definition is found in the IaC tool, the resource will converge to the desired state(either through imperative or declarative models, depending on the tool).

In the push method, the resource being managed stays in a `sleep mode`, and the communication is initiated by the IaC tool. In that case, the tool will push the desired state to the resource being managed and the resource will converge to the desired state (again, either through imperative or declarative model).

## Terraform Foundation
[Terraform](https://www.terraform.io/) is one of the main IaC tools available, and it uses a Declarative model with a push method. It can be used to manage resources in multiple cloud providers(including AWS, Azure and GCP) as well as manage resources in on-premises(like in VMware and Openshift).

It's a powerful tool that can be used to create, maintain and delete entire IT environments. This material will focus on how to use Terraform to manage AWS resources.

### Terraform Providers

[Terraform Providers](https://www.terraform.io/docs/providers/index.html) are plugins for Terraform that makes a collection of related resources available. A provider plugin is responsible for understanding API interactions with some kind of service and exposing resources based on that API.

For example, an AWS provider will enable terraform to create resources in AWS.

There are multiple Terraform Providers available, and anyone can create a provider for anything they need. Here is a list of all [Providers](https://www.terraform.io/docs/providers/index.html) provided by Terraform as well as some other [Providers](https://www.terraform.io/docs/providers/type/community-index.html) provided by the community.

During the terraform code that you'll create to deploy the resources, for example, in AWS, you'll need to inform which Provider should be used, the version of that Provider and the region where the code will be executed. Each Provider requires a different set of key/values to work properly.

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
During the code execution, considering that we're using AWS Provider, Terraform will look for credentials configured through the `aws cli` in its default location (~/.aws/credentials). You can search for different ways to authenticate [here](https://www.terraform.io/docs/providers/aws/index.html).

### Terraform State
To be able to create, change, delete and keep track of the current state of the resources being managed by itself, Terraform make uses of a file called `Terraform State`, which is used to store state about your managed infrastructure and configuration.

This state is used by Terraform to map real-world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

This state is, by default, stored in a local file named "terraform.tfstate", but it can also be stored remotely in places like S3 or similar services from other cloud providers.

With this file, Terraform can, whenever you deploy new code to your environment, alert of which resources are being added, changed or deleted, so you can make sure that the new code is executing what you expect.

To specify where the Terraform State will be stored, we use the `backend` code, as the example below:

```terraform
# Define where the terraform state will be stored
terraform {
  backend "local" {
    path = "/devopsacademy/critical/terraform.tfstate"
  }
}
```
If for any reason the state file is lost, terraform won't be able to know the resources that are managed by it. In that case,  you'll need to rely on the [import feature](https://www.terraform.io/docs/import/index.html) to try to recover the existent state, but this is a very manual and arduous task, so make sure you keep your state file safe.

Also, when running your terraform code, the state file will be put in a `lock` state to guarantee that there is no way to have more than one change happening at the same time. This helps to keep the state file consistent.


More details around the Terraform State can be found [here](https://www.terraform.io/docs/state/index.html).

## Terraform Client
The Terraform is only a single command-line application. From that, you have subcommands to interact with the Terraform code that you have in your working directory. [Here](https://www.terraform.io/docs/commands/index.html) is a full list of the options available for the terraform application, but below you have some of the most common commands used.

- **terraform init**
    - Initialize a working directory containing Terraform configuration files. This would be the first command you run after creating your code. [Details for this command](https://www.terraform.io/docs/commands/init.html)
- **terraform plan**
    - Performs a refresh and determines what actions are necessary to achieve the desired state specified in the configuration files. [Details for this command](https://www.terraform.io/docs/commands/plan.html)
- **terraform apply**
    - Apply the changes required to reach the desired state of the configuration, or the pre-determined set of actions generated by a terraform plan execution plan. [Details for this command](https://www.terraform.io/docs/commands/apply.html)
- **terraform destroy**
    - Destroy the Terraform-managed infrastructure. [Details for this command](https://www.terraform.io/docs/commands/destroy.html)

The terraform command-line can be very helpful as well. The `--help` option will provide you with all the help you need based on the scope that you are working on.

This means that `terraform --help` and `terraform init --help` will provide different outputs. The first one will give information on the terraform in general, and the second will provide help for the init option of the terraform cli.

## Terraform Resources
Resources are the main component of a Terraform code. Each resource block represents an object in the infrastructure that will be created and managed by Terraform.

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
In the example above, an EC2 Instance named `DevOpsAcademy-Instance` would be created. In this resource, we have also identified the AMI that needs to be used, the instance type and the Availability Zone that the instance should be created into. Many more optional Arguments could be added to this resource, like `key_name`, `subnet_id`, `security_group`, and many others. A list of all Argument options for EC2 can be found [here](https://www.terraform.io/docs/providers/aws/r/instance.html).

Each resource block declares a resource type and the resource name. In the example above, the instance type is `aws_instance`, and the resource name is `da_academy`.

This name defined by you have no importance outside of the Terraform scope, so it won't affect any configuration of the resource being created in AWS, in our case.

The name is essential to be referenced by another resource being created in the same Terraform code.

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

In the example above, we're using the same EC2 instance creation code, but we're adding 2 new resources to it. One of them is the resource type `aws_eip`, which creates a new Elastic IP. The other new resource is an `aws_eip_association`, which we're using to associate the EIP named `da_academy` to the EC2 instance named `da_academy`.

Keep in mind that the full name of a resource(composed by the resource type + the name of the resource) must be unique in your Terraform code.

Note that for the resource reference, there is one additional component to the names we're referencing. For example, when we are referencing the EC2 instance in the EIP association resource, we're using `aws_instance.da_academy.id`.

The `aws_instance.da_academy` we already know that represents the unique name of that particular resource, however, the additional `id` part of the reference we've used is new to us.

Each resource, when created, have a list of `Attributes`, that, just like the list of Arguments, is different for each type or resource.

In the case of the EC2 instance, the ID represents the Instance ID of an instance. EC2 instances have other Attributes when created, such as `arn`, `public_ip`, `private_ip`, `public_dns` and many more.

As you can image, it's essential to know all Arguments and Attributes of each resource available on the AWS provider. Still, there is great documentation about each resource on the [Terraform AWS provider page](https://www.terraform.io/docs/providers/aws/index.html).

When creating any Terraform code, consider the Provider documentation page your best friend. No one creating Terraform code lives without it.

## The Power of Input Variables
Having your entire infrastructure as code with Terraform is very useful, so you can have a single source of truth for your environment as well as enables you to keep reasonable control over the changes that happen in your environment.

To make IaC even more powerful, we can use variables in our code that will be used to create our resources. Input Variables serve as parameters for a Terraform code, allowing aspects of the code to be customized without altering the source code, and allowing code to be shared between different configurations.

This enables the reuse of code, so if you want to create 10 similar resources or group of resources, you only need to change the variables that will be used to create those resources.

```terraform
# Define variables
variable "instance_type" {
  type    = string
  default = "t1.micro"
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
In the case above, the `instance_type` argument of the `AWS Instance` resource can be informed during the execution of the code, allowing us to reuse this piece of code multiple times without having to change the code.

On the variable declaration, you can specify a default value, so if the value is not included during the code execution, it will use the default one.

## Outputs
Outputs are like return values from a terraform code. It can be useful, so you receive an attribute of a resource being created. It can also be used by another piece of code outside of your own.

```terraform
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```
The piece of code above would print, after executing the Terraform code, the private IP address of the instance created.

Each kind of resource has specific attributes that can be output, and you can check those attributes on the provider resource page.

## File Organization
Just like any other programming language, Terraform has it's best practices to organize the code you create.

Everything (resources, outputs, providers, state, etc) could be written in a single file with a `.tf` extension, however, to make things easier, each kind of code block should be created on a specific file.
- **_provider.tf**
  - All providers are declared on this file
- **_backend.tf**
  - The backend to be used is declared on this file
- **variables.tf**
  - The variables expected to be received during the code execution are declared on this file.
- **_outputs.tf**
  - All outputs from your code are declared on this file
- **resource_related.tf**
  - For the resources, you'll normally create a single file for each `family` of resources. Normally you'll have an `iam.tf`, `vpc.tf`, `s3.tf`, `rds.tf`, etc. In this example, all resources related to IAM, would go into the `iam.tf` file.
- **anything.tfvars**
  - In this file you would have the variables to be used during the code execution. If you have multiple environments, you can have your `dev.tfvars` and `prod.tfvars` files containing specific values for each environment and point to each file during execution based on the environment you want to apply your code.

## Running some code
Now that we have some understanding about terraform and its power let's give it a go and run some code.

First of all, make sure you have your AWS credentials configured on your machine. You can use the guide from [here](https://link-to-the-cli-config)

All the code we'll use is on the [artifacts folder](artifacts/terraform) of this repository, so just get into that directory. That way terraform will consider it as the working directory.

```bash
# Considering that you are on the folder of this file
$ cd artifacts/terraform
```
Let's initialize terraform
```bash
$ terraform init
```
The `terraform init` command will initialize the working directory and should only be run once unless you make any change on the following:
- Backend configuration
- Child Modules
- Providers 

Now that terraform is initialized, we can run the next command, which would determine the resources that need to be created/updated/removed.
```bash
$ terraform plan -var-file=./class.tfvars
```
After this command, you should see 3 resources to be created in your account. Because it's the first time that terraform is running, it's basically creating all resources defined in the code.
```bash
$ terraform apply -var-file=./class.tfvars
```
By running the command above and saying `yes` to the question you'll receive, terraform will proceed with the creation of the resources informed.

The resources should be created, and you can go into your AWS console and check that the resources listed below were successfully created:
- S3 bucket: [8char]-devopsacademy
- SecurityGroup: devopsacademy-sg

Now edit the `class.tfvars` file and change the bucket name by adding a `-2` to its name.

Additionally, edit the `sg.tf` file and change the port from 80 to 443 in the `from_port` and `to_port` arguments.

Now let's re-run the following commands:
```
$ terraform plan -var-file=./class.tfvars
```
The plan should now inform that the changes that will be made to the stack. For the S3 modifications we've made, because we're changing the name of the bucket, it will recreate it. For the SecurityGroup, because the change can be done without the need of recreating it, it will just update the configuration with new values.

## Extra

### Modules
Terraform Modules is an advanced topic and is used to reduce code duplication as well as to group up resources that are often created together.

For example, whenever a VPC is created, you normally will create Subnets, Routing Tables, NACLs, IGW and a few additional resources. With Modules, you can create a Module named `FullVPC` that receives a few inout variables values and creates all the resources that compose that module.

[This link](https://www.terraform.io/docs/modules/index.html) provides some good practices and examples around Terraform Modules.

The module will work in a similar way to an application function. It will receive inout(Input Variables), it will process the input(create resources based on the variables), and generate an output(specific attribute of a resource created). Considering this, a Terraform module will normally be composed by the following files:
- _output.tf
- variables.tf
- resources.tf

When creating resource(s) from a module, you would add a terraform code block like this:

```terraform
module "full_vpc" {
  source         = "path_to_module"
  vpc_cidr       = "192.168.0.0"
  sn_prv_a_cird  = "192.168.10.0"
  sn_prv_b_cird  = "192.168.20.0"
  sn_pub_a_cird  = "192.168.100.0"
  sn_pub_b_cird  = "192.168.200.0"
}
```

All the resources to be created would be defined in a module located in the path specified, which can be within the same repository or in a different repository. [This link](https://www.terraform.io/docs/modules/sources.html) provides some additional information and options aboud the `source definition` and [this link](https://www.terraform.io/docs/modules/composition.html) provides an smaller example of a VPC+ Subnets module.

## Appendix
- [Terraform Modules](https://www.terraform.io/docs/configuration/modules.html)
  - Modules can be used to create a set of resource that is used to compose a single delivery. For example, when you create a VPC, you also want to create subnets, routing tables, IGW, ACL, etc. It's an excellent strategy to create a module to delivery VPCs with all those components
- [Terraform Expressions](https://www.terraform.io/docs/configuration/expressions.html)
  - Expressions are an advanced topic and can be very useful for complex code, and when you need to do things like loops and ifs. For example, you can create 4 subnets with a dynamic block loop using inputs from a variable.
- Other IaC Tools
  - [CloudFormation](https://aws.amazon.com/cloudformation/)
  - [Ansible](https://www.ansible.com/)
  - [Puppet](https://puppet.com/)
  - [Chef](https://www.chef.io/)
