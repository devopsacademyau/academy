# Infrastructure as Code (IaC)

This class is an introduction Infrastructure as Code (IaC).
The main goal is to explain the purpose, the benefits and how to use it.
In this class, we'll be using Terraform as the main tool to provision resources in AWS through code.

***Contents***

- [What is a IaC?](#what-is-iac)
  - [Benefits of IaC](#benefits-of-iac)
  - [IaC Models](#iac-models)
  - [IaC Methos](#iac-methods)
- [Terraform Introduction](#terraform-introduction)
  - [Terraform Providers](#terrform-providers)
  - [Terraform State](#terraform-state)

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

## Terraform Introduction
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
  region  = "us-east-1"
}

# Create a VPC
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
terraform {
  backend "local" {
    path = "/devopsacademy/critical/terraform.tfstate"
  }
}
```
If, for any reason, the state file is lost, terraform wont be able to know the resources that are managed by it, and you'll need to rely on the [import feature](https://www.terraform.io/docs/import/index.html) to try to recover the existent state, but this is a very manual and ardue task, so make sure you keep your state file safe.


More details around the Terraform State can be found [here](https://www.terraform.io/docs/state/index.html).
