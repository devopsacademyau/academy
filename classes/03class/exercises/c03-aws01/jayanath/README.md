# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
## First, creating a new security group
> aws ec2 create-security-group \
    --group-name doa-class03-sg \
    --description "DOA Class 03 SG" \
    --vpc-id vpc-007774900b7f4c596

    {
        "GroupId": "sg-06f9585a118ad6821"
    }

## Add ingress rule to allow traffic on port 80 from anywhere
> aws ec2 authorize-security-group-ingress \
    --group-id sg-06f9585a118ad6821 \
    --ip-permissions IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges='[{CidrIp=0.0.0.0/0,Description="Port 80 traffic allowed from anywhere"}]'

## Finding the image id
> aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region ap-southeast-2
    {
        "Parameters": [
            {
                "Name": "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2",
                "Type": "String",
                "Value": "ami-0a58e22c727337c51",
                "Version": 31,
                "LastModifiedDate": "2020-07-07T07:55:08.647000+10:00",
                "ARN": "arn:aws:ssm:ap-southeast-2::parameter/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2",
                "DataType": "text"
            }
        ],
        "InvalidParameters": []
    }

## Create the launch config for the ASG
> aws autoscaling create-launch-configuration \
    --launch-configuration-name doa-launch-config \
    --key-name PubHostKeyPair \
    --image-id ami-0a58e22c727337c51 \
    --security-groups sg-06f9585a118ad6821 \
    --instance-type t2.nano \
    --user-data file://jayuserdata.txt \
    --associate-public-ip-address

## Content of the jayuserdata.txt
## Had to modify the user data to use sudo
#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
sudo mv index.html /var/www/html/
sudo systemctl start httpd

## Create the ASG
> aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name doa-asg \
    --launch-configuration-name doa-launch-config \
    --min-size 1 --max-size 2 --desired-capacity 2 \
    --health-check-grace-period 120 \
    --vpc-zone-identifier "subnet-05ba54dadeae3a83c, subnet-068196b22d394d652"

```

- Command used to get each asg instance hostname through the webserver
```
> curl http://54.253.53.246

    ip-192-168-103-107.ap-southeast-2.compute.internal%

> curl http://3.104.66.196

    ip-192-168-147-77.ap-southeast-2.compute.internal%
```

- Details of the security group used on the asg
```
> aws ec2 describe-security-groups --group-ids sg-06f9585a118ad6821
    {
        "SecurityGroups": [
            {
                "Description": "DOA Class 03 SG",
                "GroupName": "doa-class03-sg",
                "IpPermissions": [
                    {
                        "FromPort": 80,
                        "IpProtocol": "tcp",
                        "IpRanges": [
                            {
                                "CidrIp": "0.0.0.0/0",
                                "Description": "Port 80 traffic allowed from anywhere"
                            }
                        ],
                        "Ipv6Ranges": [],
                        "PrefixListIds": [],
                        "ToPort": 80,
                        "UserIdGroupPairs": []
                    },
                    {
                        "FromPort": 22,
                        "IpProtocol": "tcp",
                        "IpRanges": [
                            {
                                "CidrIp": "121.200.5.117/32"
                            }
                        ],
                        "Ipv6Ranges": [],
                        "PrefixListIds": [],
                        "ToPort": 22,
                        "UserIdGroupPairs": []
                    }
                ],
                "OwnerId": "907095435092",
                "GroupId": "sg-06f9585a118ad6821",
                "IpPermissionsEgress": [
                    {
                        "IpProtocol": "-1",
                        "IpRanges": [
                            {
                                "CidrIp": "0.0.0.0/0"
                            }
                        ],
                        "Ipv6Ranges": [],
                        "PrefixListIds": [],
                        "UserIdGroupPairs": []
                    }
                ],
                "VpcId": "vpc-007774900b7f4c596"
            }
        ]
    }
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
AWS allowes to retrieve instance metadata using curl https://169.254.169.254/latest/meta-data/hostname. This IP is valid only from within the instance. The output of the metadata command is then written to the index.html.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)