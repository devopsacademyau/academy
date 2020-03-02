# Class 03

## Contents

- [Introduction](#introduction)
- [Pet vs Cattle](#pet-vs-cattle)
- [AWS EC2 Auto Scaling Group (ASG)](#aws-ec2-auto-scaling-group-asg)
  - [How it works](#how-it-works)
  - [Automating EC2 instances](#automating-ec2-instances)
- [AWS Load Balancer](#aws-load-balancer)
  - [AWS Certificate Manager](#aws-certificate-manager)
- [Route53](#route-53)
- [References](#references)

## Introduction

At this stage of the DevOps Academy we will start connecting the dots and understand why we have been learning this many different subjects.

The project #1 kickoff is coming soon and will use most of the concepts that we have seen so far.

This article will cover what's the conect of Cattle and Pets and why you should chose one over the other. You'll learn how to implement both concepts using AWS services.


## Pet vs Cattle

The analogy comes from how do you treat your servers.

In the old days, you would even give a name to your server like, Thunder/Flash or Tiger/Monkey if you prefer animal names.

Very much like a PET where you need to individually take care of it, install programs, patch things, etc. 

Pet servers have issues with scaling up and down. For example a server hosting an e-commerce that is getting more clients than what was expected, a shutdown will have to be done to upgrade resources.

These days with automation, we now treat servers as cattle, where if one server dies, we will just replace it using scripts and alerting.

Auto scalings will make sure to create X number of instances needed to handle the traffic at a point in time.

## AWS EC2 Auto Scaling Group (ASG)

The service can be found at Services > Compute > EC2 > Auto Scaling > Create Auto Scaling group

EC2 Auto Scaling ensures that you always have the number of instances needed to handle the load of your application. Based on health checks and resources consumption logs, the ASG will create new instances or shutdown the ones that are idle.

You could probably have been asking yourself: if I have two servers running my website, how my clients will access both of them?

This is where [Load Balancers](#aws-load-balancer) will help balancing requests through your array of servers created by an ASG. [Load Balancers](#aws-load-balancer) will be introduced later in this article.

ASG are described in 3 key components:

- Groups
  - a group treats an array of server as one logical resource. When creating a group you have to specify its minimum, maximum and desired number of EC2 instances.
    - minimum: have at least this minimum of EC2 instances online
    - maximum: have this maximum of EC2 instances online
    - desired: try to keep this desired number

![asg-concepts](/classes/03class/aws/assets/asg-concepts.png)

- Configuration templates
  - specify instance image ID (AMI ID), instance type, ssh key, security group and storage options

- Scaling options
  - scale up and down the number of instances based on set of defined rules

There are no costs of creating an ASG by itself. The cost will only be related to the number and type of EC2 instances that your group create.

Understanding your application is key when building an ASG. Ask yourself questions like:

- what are the required software that my application need
- does it need to do any pre-configuration before running the main application
- how many instances do I need to have always running

ASG as any other tool, is not a silver bullet for all the use cases. Applications that have persistent storage use could be hard to scale up and down as it need. In specific cases, the application might have to be re-designed to handle multiple access to its state.

The idea os scaling up and down based on needs is where the cloud computing shines and applications have to be developed with this mindset.

### How it works

Once you create an ASG, the group will make sure to have the set amount of instances requested at any point in time. A 1/1/1 ASG is a group with `minimum: 1` `maximum: 1` `desired: 1` EC2 instances, or basically just one instance.

If you manually shutdown your instance, the ASG will identify the its instance is not healthy and will start a new one.

You can remove the instance from the ASG and start managing it manually if you wish so.

If those instances can be deleted and restarted at any time to maintain the desired number of instances for the group. How would I keep all the configurations on it?

### Automating EC2 instances

When thinking how to design an application/server to run from a dynamic instance, you will have to think if the required software change often or not.


#### AMI

For example, my server needs an antivirus agent, nginx webserver and once it starts, it needs to deploy the application itself.

Both the antivirus agent and the nginx webserver won't change their versions very often (less than once per week), so it will be a good idea to create a custom [Amazon Machine Image (AMI)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) with those softwares already installed. So when the ASG creates a new instance, those software will be there already.

#### UserData

The application deployment gets a little bit trickier as you will expect that everytime a new server comes up, to go and pickup your latest code to be deployed. So this is not a good candidate to be part of the instance image.

The UserData is a script (bash or other languages) that you can make it run once your EC2 instance have the operational system ready to start.

On this script you can for example, checkout a git repository, build your code and deploy to your running nginx webserver.


## AWS Load Balancer

Your webserver is now running on an ASG and being scaled up and down based on your computing resources needs or any other metrics that you chose. How would your users know to which instance they need to connect and how many of those are available at any point in time?

That's how the load balancer works. Your clients will access through the load balancer and the LB will be in charge of balancing the requests across your instances.

![ASG-LB](/classes/03class/aws/assets/ASG-LB.png)

Load balancers can be of a few different types depending on what layer the routing decision should be:

- Application Load Balancer
  - application layer (HTTP/HTTPS)
- Network Load Balancer
  - transport layer (TCP/SSL)
- Classic Load Balancer
  - either application (HTTP/HTTPS) or transport (TCP/SSL) layer

This material will be focused only on the Application Load Balancer which is used for most of the use cases.

### Application Load Balancer (ALB)

The service can be found at Services > Compute > EC2 > Load Balancing > Load Balancers > Create Load Balancer > ALB

An ALB can serve as a single point of contact for clients and distribute traffic across multiple targets, such as EC2 Instances, in multiple Availability Zones. When creating an ALB you will have to chose from 2 different types and in which Availability Zones your LB will be available:

- internet-facing: routes requests from public internet to targets
- internal: routes requests only from clients to targets using private IP addresses

Basically an ALB has two main components: listeners and target groups.

```Load balancers are included on the AWS free-tier. However, please remember to delete any unused resources to avoid any costs```

#### listeners

A listener tries to match requests from clients based on, among many types, protocol/port and path-based routing. For example a request on port `443` can redirect the traffic to an internal server running on port `80` or a request to `/admin` sends the traffic to a specifc EC2 Instance.

Each listener rule consists in a priority of actions and one or more conditions. When the conditions for a rule are met, the traffic is then forwarded to a target group and the remaining rules are ignored.

#### target group

Target groups send requests to one EC2, an ASG and others. Healthchecks can be used to check whether the service is up and running and can start receiving traffic from the load balancer.

Those healthchecks can also be linked to an ASG to send termination requests if the instance is not working correctly.

![alb](/classes/03class/aws/assets/alb.png)

### AWS Certificate Manager

If your service is being exposed through an ALB on port 443, a SSL certificate will need to be attached to the listener.

AWS offers a service for generating SSL certificates for free if you are using with managed services like a load balancer.

Read more about AWS ACM and SSL certificates [here](https://aws.amazon.com/certificate-manager/getting-started/?nc=sn&loc=7)

## Route53

Route 53 (R53) is the DNS managed service offered by AWS. To consume this service you first need to create either private or public hosted zones.

- public hosted zone: can be public accessible. You will need to own a domain and point the `ns` records to the zone created to be managed by AWS.
- private hosted zone: will only be resolved by local workloads running on your VPC.

Unfortunately this is not included on the AWS free-tier. However the cost is only $1AUD/month per hosted zone.

If you wish to try a public hosted zone, you can generate a free domain at `http://www.dot.tk/en/index.html?lang=en`, create a public hosted zone with the same name as your domain and follow the directions to create the `ns` records and managed your new domain through Route53.

Most common DNS record types are:

- `A` -> map an IPv4 address to a name. i.e. 50.200.34.25 > www.devopsacademy.com.au
- `CNAME` -> maps the record name to another domain. i.e. login.devopsacademy.com.au > www.devopsacademy.com.au. CNAMES can't map to the APEX domain (main domain).
- `NS` -> identify the nameservers for that domain. i.e. ns1-devopsacademyau.com.au
- `TXT` -> contains one or more strings enclused in double quotation marks. i.e. "string1"

R53 also offers `A` and `CNAME` record as an alias where you can use the APEX domain, for example creating a CNAME for devopsacademy.com.au.

Reference: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html
#### ALB DNS

Once you create an ALB, a random public Amazon DNS string will be provided so you can access your service. This DNS will not be friendly and should not be shared with your clients.

It will look something like `default-173007695.us-east-1.elb.amazonaws.com.`

Ideally you would create a `CNAME` record to point this aws random string to a friendly name on your dns `mywebsite.myowndomain.tk`.


## References

- [What is an ASG](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)
- [AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)
- [UserData](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
- [Load Balancer Types](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/load-balancer-types.html)
- [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [Begineers guide to AWS auto-scaling](https://www.tothenew.com/blog/beginners-guide-to-aws-auto-scaling/)
- [Using domain name with Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/using-domain-names-with-elb.html)
- [What is SSL?](https://blog.hubspot.com/marketing/what-is-ssl)
- [CNAME Records?](https://support.dnsimple.com/articles/cname-record/)
