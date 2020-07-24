# C04-IAC01

## Terraform code

- <_backend.tf>
- <_provider.tf>
- <ec2.tf>
- <iam.tf>
- <s3.tf>
- <security-group.tf>

## Command Execution Output

- <output.txt>

$ terraform apply "DA_IAC01plan"

```
aws_iam_role.ec2_s3_access_role: Creating...
aws_security_group.DA-sg: Creating...
aws_s3_bucket.terrform-da-bucket: Creating...
aws_security_group.DA-sg: Creation complete after 3s [id=sg-0ad103d34ddf94066]
aws_iam_role.ec2_s3_access_role: Creation complete after 3s [id=ec2_s3_access_role]
aws_iam_role_policy.S3_read_policy: Creating...
aws_iam_instance_profile.test_profile: Creating...
aws_s3_bucket.terrform-da-bucket: Creation complete after 5s [id=da-july-bucket]
aws_iam_role_policy.S3_read_policy: Creation complete after 2s [id=ec2_s3_access_role:test_policy]
aws_iam_instance_profile.test_profile: Creation complete after 3s [id=test_profile]
aws_instance.da-instance: Creating...
aws_instance.da-instance: Still creating... [10s elapsed]
aws_instance.da-instance: Still creating... [20s elapsed]
aws_instance.da-instance: Still creating... [30s elapsed]
aws_instance.da-instance: Creation complete after 31s [id=i-0f68929873924aee8]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
Outputs:

instance_ip_addr = 54.252.250.98


```

$ aws s3 cp /home/nimmi/test.json s3://da-july-bucket upload: ../../../../../../../test.json to s3://da-july-bucket/test.json

$ ssh ec2-user@54.252.250.98 -i /home/nimmi/resources/C01-AWS01KeyPair.pem Last login: Thu Jul 23 07:30:21 2020 from 203.214.56.109

```
__|  __|_  )
   _|  (     /   Amazon Linux 2 AMI
  ___|\___|___|
```

<https://aws.amazon.com/amazon-linux-2/>

$ aws s3 ls s3://da-july-bucket 2020-07-23 07:35:01 1091 test.json

--------------------------------------------------------------------------------

Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac01/README.md)
