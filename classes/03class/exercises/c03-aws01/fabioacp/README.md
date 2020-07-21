# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```bash
# Get VPC
❯ aws ec2 describe-vpcs --query "Vpcs[*].VpcId" --output=text
vpc-8beeebec

# Create a SG
❯ aws ec2 create-security-group --group-name facp-sg-C03-aws01 --description "SG for exercise C03-aws01" --vpc-id vpc-8beeebec
{
    "GroupId": "sg-095154c98505dbfb4"
}
# Allow connection from anywhere to port 80
aws ec2 authorize-security-group-ingress \
    --group-name facp-sg-C03-aws01 \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

# Create file://facp-user-data.txt
{
        echo '#! /bin/bash'
        echo 'yum update -y'
        echo 'yum install -y httpd'
        echo 'curl 169.254.169.254/latest/meta-data/hostname > index.html'
        echo 'mv index.html /var/www/html/'
        echo 'systemctl start httpd'
} >> facp-user-data.txt

# Create a launch configuration 
❯ aws autoscaling create-launch-configuration \
  --launch-configuration-name facp-launch-config \
  --image-id ami-0a58e22c727337c51 \
  --instance-type t2.nano \
  --security-groups sg-095154c98505dbfb4 \
  --user-data file://facp-user-data.txt \
  --associate-public-ip-address

# Get Subnets
❯ aws ec2 describe-subnets --query "Subnets[*].[SubnetId, AvailabilityZone]"
[
    [
        "subnet-a50917ec",
        "ap-southeast-2b"
    ],
    [
        "subnet-f1fc63a9",
        "ap-southeast-2c"
    ],
    [
        "subnet-d2779ab4",
        "ap-southeast-2a"
    ]
]

  # Create a auto scaling group
aws autoscaling create-auto-scaling-group \
--auto-scaling-group-name facp-auto-scaling-group \
--launch-configuration-name facp-launch-config \
--min-size 1 \
--max-size 2 \
--desired-capacity 2 \
--vpc-zone-identifier "subnet-d2779ab4,subnet-a50917ec"

```

- Command used to get each asg instance hostname through the webserver
```bash
# Get Instance Ids
❯ aws autoscaling describe-auto-scaling-groups \
--auto-scaling-group-name facp-auto-scaling-group \
--query "AutoScalingGroups[*].Instances[*].[InstanceId]" \
--output=text
i-02e754619ef69f026
i-092c099dcf1a9bdbf

❯ aws ec2 describe-instances \
    --instance-ids "i-02e754619ef69f026" "i-092c099dcf1a9bdbf" \
    --query "Reservations[*].Instances[*].[InstanceId, PrivateDnsName]" \
    --output=text
i-02e754619ef69f026	ip-172-31-39-94.ap-southeast-2.compute.internal
i-092c099dcf1a9bdbf	ip-172-31-8-2.ap-southeast-2.compute.internal

❯ curl http://13.211.133.23:80  
ip-172-31-39-94.ap-southeast-2.compute.internal

❯ curl http://54.206.92.141:80
ip-172-31-8-2.ap-southeast-2.compute.internal

```

- Details of the security group used on the asg
```
❯ aws ec2 describe-security-groups \
    --group-ids sg-095154c98505dbfb4
{
    "SecurityGroups": [
        {
            "Description": "SG for exercise C03-aws01",
            "GroupName": "facp-sg-C03-aws01",
            "IpPermissions": [
                {
                    "FromPort": 80,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "978009416274",
            "GroupId": "sg-095154c98505dbfb4",
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
            "VpcId": "vpc-8beeebec"
        }
    ]
}

```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
Retrieves the instance metadata (host name) and saves it into the index.html
```
Resources

> [Create launch configuration](https://docs.aws.amazon.com/cli/latest/reference/autoscaling/create-launch-configuration.html)

> [Create auto scaling group](https://docs.aws.amazon.com/cli/latest/reference/autoscaling/create-auto-scaling-group.html)

> [Authorize security group ingress](https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html)

> [Retrieving instance metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)


<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)