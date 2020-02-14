* WIP


## Contents

- [Introduction]()
- [Basic Networking]()
- [Cloud Networking]()
  - [AWS Networking]()
    - [VPC]()
    - [Subnets]()
    - [Internet Gateway]()
    - [NAT Gateway]()
    - [Routing Table]()
    - [Elastic IP]()
    - [Elastic Network Interface]()
    - [Network ACL]()
    - [Security Groups]()
    - [VPN/Direct Connect]()
    - [Transit Gateway]()
    - [VPC Peering]()
- [References]()


## Introduction

Networking is one of the hardest subjects to learn (and teach) in Information Technology alongside with development, data, and others. This class does not have the intention to be a scientific topic about network but rather a tentative of abstracting complex definitions in simple situations for beginners to understand.

### In a traditional infrastructure, what establishes that I have a LAN (local area network)?

A computer with a manual IP address configured constitutes in a LAN, although it won't be able to communicate with 

- One computer connected directly to another by cable (very old method)
- A computer sharing its wireless connection (WLAN)
- Computers connected to a switch (switch is basically a controller that enables devices to talk to each other within ONE LAN - you can still have VLANS to segregate that ONE lan)


### What if from my LAN, I need to connect to the wide area network (WAN), often called internet, or to a second LAN i.e. another office branch?

For connecting multiple networks together, a router is needed. Either as a full hardware device or just an application working as a Router. This device will be in charge of knowing all existing paths, receive requests from a network and forward the packages to its destination.

### Internet Protocol Address (IP)

An IP is a numerical, human-readable way of assigning a computer to a network. For example ``. The protocol has two addressiong versions are available:

- IPv4 as a 32-bit address. i.e.: 172.16.254.1
- IPv6 as a 128-bits address. i.e.: 2001:db8:0:1234:0:567:8:1

IPv6 was introduced a few years ago due to the growth of the internet and the depletion of available IPv4 addresses. IPv6 is out of context of this material. For reference: https://docs.aws.amazon.com/vpc/latest/userguide/get-started-ipv6.html

Reference content for deep-dive information:

- [Wikipedia IP_address](https://en.wikipedia.org/wiki/IP_address)
- [AWS IP Addressing](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html)

I highly recommend going deeply and trully understanding how networks work through the above reference links before moving on.


## Basic networking

What we need to understand to get started with networking in the cloud is how to do some basic network seggregation with subnets and ip addressing.

Subnets are made to isolate traffic within a network and provide security on the data being transmitted. Moving forward our examples will be based on a four individual subnets scenario.

It is a best practice to isolate networks that have databases or private systems running from workloads that can be accessible from the internet. The naming convention for these subnets are: 

- `private` subnet
  - Workloads like databases or identity management systems will run here
  - Any service running in this subnet won't be accessible direct from public networks (like internet). To access applications 
  - Services can go out to the internet through a nat gateway.
  - to access a workload here, a jumpbox from the public subnet is neccesary

- `public` subnet
  - good fit for frontend webservers where clients will have the first point of contact. From the webserver you can then communicate with backend servers running on private subnets
  - nat gateways (translate private IP's to public IP's)

Very often a `secure` subnet will also be presented and is mainly used for databases. The secure subnet won't have neither IN or OUT access to internet and can only be accessed from workloads running in `private` subnet.

Don't get me wrong here, those are just conventions.

## Cloud Networking

Most of today's cloud providers share the same concept of Virtual Private Cloud (VPC) for stablishing a logically isolated section of network within your account.

A VPC can then be sliced into multiple networks called subnets where you will have control on IP address ranges, route tables and control security within these sections.

### AWS Networking

Subnets within a VPC on AWS environment are bound to only one Availability Zone (AZ). To achieve high availability (in case one AZ goes off) of a workload, we need to create the one public/private subnet per AZ, so 4 subnets in total for this example.

This article will now move into a tutorial style with information needed for creating a fully working VPC with a few subnets. Explicit instructions/commands/where to go on AWS console can easily be found on the provider documentation. 

As always, we recommend to play around in the console and familiarise yourself with it. There is not better way to learn:

What we will be doing:

- ip addressing design
- build a VPC
  - subnet public
    - internet gateway
  - subnet private
    - network gateway
  - routing table

#### VPC

The first thing is to determine what will be the network size for the whole VPC. AWS supports networks up to `65.536` IP's reffered as a `/16` network. 

It's always ideal to think ahead how many devices your network will support and only reserve the right amount of addresses need with some extra for future expansions. Although we won't need this many IP's, for this example we will be using the `/16` network as it will simplify the big picture understanding.


|field|value|
|-|-|
|Name tag|devopsacademy|
|IPv4 CIDR Block|10.0.0.0/16|
|IPv6|no|
|Tenancy|default

There is no cost for creating a VPC.

#### Subnets

Subnets can then be sliced to smaller chunks of ip addressing to isolate workloads. The most common size for a subnet is a `/24` which will support `256` IP's.

It's important to mentiont that only `251` IP's out of `256` will be available to be assigned to hosts as a few of them are special addresses.

- of any subnet:
  - first ip (0) is known as `network`
  - last ip (255) is used for broadcasting
 
- of any AWS subnet:
  - second ip (1) is reserved to be used by the VPC Router
  - third ip (2) is reserved to be used by AWS DNS
  - forth ip (3) is reserved for future use

Based on that, our subnetting will look like this:

Note that the range `from` and `to` of each network can't overlap with each other. This is a network routing restriction.

|subnet|Availability Zone|network|cidr|from|to|ips|
|-|-|-|-|-|-|-|
|private-a|ap-southeast-2a|10.0.1.0|24|10.0.1.4|10.0.1.254|251
|private-b|ap-southeast-2b|10.0.2.0|24|10.0.2.4|10.0.2.254|251
|public-a|ap-southeast-2a|10.0.10.0|24|10.0.10.4|10.0.10.254|251
|public-b|ap-southeast-2b|10.0.11.0|24|10.0.11.4|10.0.11.254|251

For each subnet:

|field|value|
|-|-|
|Name tag|refer to above table|
|VPC|devopsacadem|
|Availability Zone|refer to above table
|VPC CIDR|none
|IPv4 CIDR Block|refer to above table

Now, what it makes a `public`/`private` subnet actually be considered `public` or `private` ?

#### Internet Gateway

#### NAT Gateway

## References

- [Wikipedia IP_address](https://en.wikipedia.org/wiki/IP_address)
- [AWS IP Addressing](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html)
- [AWS VPC](https://aws.amazon.com/vpc/)
