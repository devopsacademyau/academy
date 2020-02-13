
VPC

Subnets public, privates and secure (out of scope)

subnet per AZ - example use 2 subnets per az, 2 az's = 4 subnets (public/private)

vpn / direct connect (mention but out of topic)

routing by default within subnets on the same VPC

elastic public IP

elastic network interface (ENI)

nat gateway = expensive

internet gateway

transit gateway (mention but out of topic)

acl / security groups

## Introduction

Networking is one of the hardest subjects to learn (and teach) in Information Technology alongside with development, data, and others. This class does not have the intention to be a scientific topic about network but rather a tentative of abstracting complex definitions in simple situations for beginners to understand.

### In a traditional infrastructure, what establishes that I have a LAN (local area network)?

A computer with a manual IP address configured constitutes in a LAN, although it won't be able to communicate with 

- One computer connected directly to another by cable (very old method)
- A computer sharing its wireless connection (WLAN)
- Computers connected to a switch (switch is basically a controller that enables devices to talk to each other within ONE LAN - you can still have VLANS to segregate that ONE lan)


### What if from my LAN, I need to connect to the wide area network (WAN), often called internet, or to a second LAN i.e. another office branch?

For connecting multiple networks together, a router is needed. Either as a full hardware device or just an application working as a Router. This device will be in charge of knowing all existing paths, receive requests from a network and forward the packages to its destination.

