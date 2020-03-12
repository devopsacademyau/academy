# Module Challenge (c04-iac04)

In this exercise you'll create and use a Terraform module. The objective is to create a module that will deliver the following:

- ALB that will distribute the load for an ASG group of EC2 instances.
- The ASG will have 2 scaling policies(one to increase and another to decrease the number of hosts).
- Security Groups so the ALB can be accessed from the internet
- It should output the ALB FQDN(the DNS that you use to access the ALB endpoint)
- The following variables should be provided when using the module:
    - AMI to be used
    - Subnets to be used
    - Values for the ASG policies

Deploy the code into your AWS and confirm the website is accessible(you can use curl)

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the files from your answer.

The structure to be provided on the answer, should follow a structure similar to this:
```
terraform-apply.txt
output.txt
README.md
terraform-code
    └── iac-04-module
        └── module files
    └── _backend.tf
    └── _provider.tf
    └── output.tf
    └── main.tfvars
    └── main.tf
```

- terraform-apply.txt 
    - with the output of the `terraform apply` command
- output.txt
    - with the output of the curl command accessing your website
- terraform code folder
    - with all your terraform code:
        - iac-04-module
            with all modules related files
        - _backend.tf
            - with tthe backend configuration
        - _provider.tf
            - with the provider configuration
        - output.tf
            - with the outputs
        - main.tfvars
            - with the input variables
        - main.tf
            - with all your resources
        - variables.tf
            - with your variables definition


Your state file should not be include in your PR.

## References
- [Terraform AWS Resources](https://www.terraform.io/docs/providers/aws/index.html)
- [terraform Modules](https://www.terraform.io/docs/modules/index.html)
