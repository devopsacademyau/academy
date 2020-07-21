# C04-IAC01

## Terraform code 

- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [ec2.tf](ec2.tf)
- [iam.tf](iam.tf)
- [s3.tf](s3.tf)
- [security-group.tf](security-group.tf)

### Attachments

- [network.tf](network.tf): contains the base network resources, vpc, subnet, route table, igw
- [outputs.tf](outputs.tf): define the plan output after creation.
- [variables.tf](variables.tf): define all variables used
- [terraform.tfvars](terraform.tfvars): set a value for the variables

## Command Execution Output

- [output.txt](output.txt): contains the terraform plan

## Terraform apply output

```bash
$ terraform apply -auto-approve
aws_iam_policy.s3_readonly: Creating...
aws_iam_role.s3_readonly: Creating...
aws_vpc.vpc_devops: Creating...
aws_s3_bucket.default: Creating...
aws_iam_role.s3_readonly: Creation complete after 3s [id=user_readonly_s3]
aws_iam_instance_profile.s3_readonly: Creating...
aws_iam_policy.s3_readonly: Creation complete after 4s [id=arn:aws:iam::097922957316:policy/s3_readonly_policy]
aws_iam_policy_attachment.s3_readonly: Creating...
aws_iam_role_policy_attachment.s3_readonly: Creating...
aws_vpc.vpc_devops: Creation complete after 7s [id=vpc-00bc8d157b319f533]
aws_internet_gateway.igw_default: Creating...
aws_subnet.subnet_devops: Creating...
aws_security_group.sg_allow_ssh: Creating...
aws_s3_bucket.default: Creation complete after 7s [id=devops-alima-bucket]
aws_iam_instance_profile.s3_readonly: Creation complete after 4s [id=ec2-s3-readonly-profile]
aws_iam_role_policy_attachment.s3_readonly: Creation complete after 4s [id=user_readonly_s3-20200721214506755900000001]
aws_internet_gateway.igw_default: Creation complete after 1s [id=igw-0783ffded1e47b360]
aws_route_table.rt_devops: Creating...
aws_subnet.subnet_devops: Creation complete after 1s [id=subnet-0521578e7666be18a]
aws_iam_policy_attachment.s3_readonly: Creation complete after 5s [id=ec2-s3-readonly-policy-attachment]
aws_route_table.rt_devops: Creation complete after 1s [id=rtb-0f4b74d02bda040f3]
aws_route_table_association.subnet_route_link: Creating...
aws_security_group.sg_allow_ssh: Creation complete after 2s [id=sg-0cfae33d15dba3c5e]
aws_instance.ec2_default: Creating...
aws_route_table_association.subnet_route_link: Creation complete after 0s [id=rtbassoc-0b0c7f4b1f707484c]
aws_instance.ec2_default: Still creating... [10s elapsed]
aws_instance.ec2_default: Still creating... [20s elapsed]
aws_instance.ec2_default: Still creating... [30s elapsed]
aws_instance.ec2_default: Creation complete after 33s [id=i-09c962fee6e2d35a8]

Apply complete! Resources: 13 added, 0 changed, 0 destroyed.
```

*Output:*

```json
ec2_instance = {
  "id" = "i-09c962fee6e2d35a8"
  "public_id" = "52.63.71.51"
}
network_resources_ids = {
  "igw_id" = "igw-0783ffded1e47b360"
  "route_table_id" = "rtb-0f4b74d02bda040f3"
  "security_group_id" = "sg-0cfae33d15dba3c5e"
  "subnet_id" = "subnet-0521578e7666be18a"
  "vpc_id" = "vpc-00bc8d157b319f533"
}
s3_bucket = {
  "bucket" = "devops-alima-bucket"
  "domain_name" = "devops-alima-bucket.s3.amazonaws.com"
  "id" = "devops-alima-bucket"
}
```

## Does it works? time 😁

```bash
# just upload the readme file so we can list it from the other side ;)
$ aws s3 cp README.md s3://devops-alima-bucket/readme.md
upload: ./README.md to s3://devops-alima-bucket/readme.md     

$ ssh ec2-user@52.63.71.51
The authenticity of host '52.63.71.51 (52.63.71.51)' can't be established.
ECDSA key fingerprint is SHA256:w0SZx68Xw5jrzWtuaxJ4y41WRfOxRj2q0IKCKMOAghY.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '52.63.71.51' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
17 package(s) needed for security, out of 38 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-32-0-127 ~]$ aws s3 ls # this line will fail, the ec2 only can list the bucket devops-alima-bucket

An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied
[ec2-user@ip-172-32-0-127 ~]$ aws s3 ls s3://devops-alima-bucket
2020-07-21 21:47:08       3243 readme.md
```


***
Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac01/README.md)