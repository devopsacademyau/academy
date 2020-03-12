# VPC (c04-iac02)

In this exercise, you'll need to create a new VPC called `devopsacademy-iac`, but this time, every resource of this VPC will be created using Terraform. Similar to the [exercises done for class02](https://github.com/devopsacademyau/academy/tree/master/classes/02class/exercises).

All your resources must be created in a single `vpc.tf` file.
Your VPC will be composed by:
- /16 CIDR of your choice in the 10.0.X.X range
- 4 /24 Subnets, being 2 publics and  privates
- Internet GW attached to your VPC
- 1 NAT GW (this will have costs. not mandatory to create)
- Routing tables for the subnets be able to communicate witht he internet

Output the following information from your terraform execution:
- VPC CIDR
- All Subnets CIDR

The following values should be provided through input variables:
- VPC CIDR
- Subnet 1 Name
- Subnet 1 CIDR
- Subnet 2 Name
- Subnet 2 CIDR
- Subnet 3 Name
- Subnet 3 CIDR
- Subnet 4 Name
- Subnet 4 CIDR

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
    - _backend.tf
        - with the backend configuration
    - _provider.tf
        - with the provider configuration
    - vpc.tf
        - with all your resources
    - output.tf
        - with the outputs
    - main.tfvars
        - with the input variables
    - variables.tf
        - with the variables definitions
    - output.txt 
        - with the output of the `terraform plan` command

Your state file can be local, and should not be include it in your PR.

## References
- [Terraform AWS Resources](https://www.terraform.io/docs/providers/aws/index.html)
