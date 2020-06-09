# C04-IAC04

## Command Execution Output

├── [output.txt](output.txt)
├── [README.md](README.md)
├── [terraform-apply.txt](terraform-apply.txt)
└── [terraform-code/](terraform-code/)
    ├── alb
    │   ├── alb.tf
    │   ├── output.tf
    │   └── variables.tf
    ├── asg
    │   ├── asg.tf
    │   ├── userdata.sh
    │   └── variables.tf
    ├── _backend.tf
    ├── main.tf
    ├── network
    │   ├── output.tf
    │   ├── security-group.tf
    │   ├── variables.tf
    │   └── vpc.tf
    ├── _provider.tf
    ├── terraform.tfvars
    └── variables.tf


## Questions:
- What is the benefit of having the Terraform code for the resources within the module you've created?
    - it's much easier to manage all the variables in tfvars in just one file and all change it accordingly depending on environment you want to create
    for example you could have different tfvars for different environments like dev, test and prod.

 
***
Answer for exercise [c04-iac04](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac04/README.md)
