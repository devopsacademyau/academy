# Module Challenge (c04-iac04)
## AWS Terraform module. The objective of it is build the following:

- ALB that will distribute the load for an ASG group of EC2 instances.
- The ASG will have 2 scaling policies(one to increase and another to decrease the number of hosts).
- Security Groups so the ALB can be accessed from the internet
- It should output the ALB FQDN(the DNS that you use to access the ALB endpoint)
- The following variables should be provided when using the module:
    - AMI to be used
    - Subnets to be used
    - Values for the ASG policies