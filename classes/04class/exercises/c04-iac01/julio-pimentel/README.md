# C04-IAC01

## Terraform code 
- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [ec2.tf](ec2.tf)
- [iam.tf](iam.tf)
- [s3.tf](s3.tf)
- [security-group.tf](security-group.tf)

## Command Execution Output
- [output.txt](output.txt)

# Command Execution to install Terraform in AWS Console

# 1. Install Terraform on AWS Console 
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# 2. Deploy Terraform infra

terraform init
terraform plan 
terraform apply 


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/af71c8c5c94a36439854d642cc64ac103d8507e3/classes/04class/exercises/c04-iac01/README.md)