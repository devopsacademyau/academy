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

