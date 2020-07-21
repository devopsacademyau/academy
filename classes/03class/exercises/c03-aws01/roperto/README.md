# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
AMI=$(aws ec2 describe-images --owners amazon \
    --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
    --query "sort_by(Images, &CreationDate)[-1].ImageId" --output text)

SG=sg-0d39156c72d374a9c

USER_DATA='#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
'

ASG=da-asg
ASG_CFG="${ASG}-cfg"
SUBNET_A=subnet-0d4986c79f7cd8e16
SUBNET_B=subnet-0e2e2f2420e06f0c0

aws autoscaling create-launch-configuration \
    --launch-configuration-name $ASG_CFG \
    --image-id $AMI \
    --key-name devops-key \
    --security-groups $SG \
    --user-data "$USER_DATA" \
    --instance-type t2.nano \
    --associate-public-ip-address

aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name $ASG \
    --launch-configuration-name $ASG_CFG \
    --min-size 1 \
    --max-size 2 \
    --desired-capacity 2 \
    --vpc-zone-identifier "${SUBNET_A},${SUBNET_B}"
```

- Command used to get each asg instance hostname through the webserver
```
aws ec2 describe-instances --query 'Reservations[].Instances[].PublicIpAddress'
[
    "3.25.51.161",
    "13.239.31.155"
]

$ curl 3.25.51.161
ip-10-42-21-9.ap-southeast-2.compute.internal

$ curl 13.239.31.155
ip-10-42-20-150.ap-southeast-2.compute.internal
```

- Details of the security group used on the asg
```
$ aws ec2 describe-security-groups --group-ids $SG
{
    "SecurityGroups": [
        {
            "Description": "Allow HTTP for testing",
            "GroupName": "c03-aws01",
            "IpPermissions": [
                {
                    "FromPort": 80,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0",
                            "Description": "Allow public access to the webserver"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "073145331885",
            "GroupId": "sg-0d39156c72d374a9c",
            "IpPermissionsEgress": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "c03-aws01"
                }
            ],
            "VpcId": "vpc-0b374a631c3066687"
        }
    ]
}
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
It fetches the hostname in the instance metadata and saves it in a local file (which will be used as the default page in Apache).
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)