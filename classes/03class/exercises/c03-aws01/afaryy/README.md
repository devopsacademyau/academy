# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```bash
# Set variables
VPC_NAME='da-c02-vpc';
VPC_ID=$(aws ec2 describe-vpcs \
    --filter "Name=tag:Name,Values=$VPC_NAME" \
    --query Vpcs[].VpcId --output text);
echo $VPC_ID

PUBLIC_SUBNET_A_NAME='da-c02-public-a';
PUBLIC_SUBNET_A_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PUBLIC_SUBNET_A_NAME" \
    --query 'Subnets[].SubnetId' --output text);
echo $PUBLIC_SUBNET_A_ID

PUBLIC_SUBNET_B_NAME='da-c02-public-b';
PUBLIC_SUBNET_B_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PUBLIC_SUBNET_B_NAME" \
    --query 'Subnets[].SubnetId' --output text);
echo $PUBLIC_SUBNET_B_ID

SG_NAME='da-c02-public-sg'
SG_ID=$(aws ec2 describe-security-groups  \
    --filter "Name=tag:Name,Values=$SG_NAME" \
    --query "SecurityGroups[0].GroupId" \
    --output text);
echo $SG_ID

AMI=$(aws ec2 describe-images --owners amazon \
    --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
    --query "sort_by(Images, &CreationDate)[-1].ImageId" --output text)
echo $AMI

ASG_CFG_NAME="da-c03-asg-cfg"
ASG_NAME="da-c03-asg"
INTANCE_TYPE="t2.micro"
KEY_NAME="da-key"

# Create user_data file
cat << EOF > ~/Repo/da-excercises/c03-aws01/afaryy/c03-aws01-userdata.txt
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
EOF

# Create lauch configuration
aws autoscaling create-launch-configuration \
    --launch-configuration-name $ASG_CFG_NAME \
    --key-name $KEY_NAME \
    --image-id $AMI \
    --instance-type $INTANCE_TYPE  \
    --user-data file://~/Repo/da-excercises/c03-aws01/afaryy/c03-aws01-userdata.txt  \
    --associate-public-ip-address \
    --security-groups $SG_ID

aws autoscaling describe-launch-configurations \
    --launch-configuration-name $ASG_CFG_NAME

    {
    "LaunchConfigurations": [
        {
            "LaunchConfigurationName": "da-c03-asg-cfg",
            "LaunchConfigurationARN": "arn:aws:autoscaling:ap-southeast-2:421117346104:launchConfiguration:20d2f2cc-bf88-4714-a260-776531911129:launchConfigurationName/da-c03-asg-cfg",
            "ImageId": "ami-0099823645f06b6a1",
            "KeyName": "da-key",
            "SecurityGroups": [
                "sg-03c842207ddde4f96"
            ],
            "ClassicLinkVPCSecurityGroups": [],
            "UserData": "IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQK",
            "InstanceType": "t2.micro",
            "KernelId": "",
            "RamdiskId": "",
            "BlockDeviceMappings": [],
            "CreatedTime": "2020-09-05T03:19:21.634000+00:00",
            "EbsOptimized": false,
            "AssociatePublicIpAddress": true
        }
    ]
}

# Create auto scaling group
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name $ASG_NAME \
    --launch-configuration-name $ASG_CFG_NAME \
    --min-size 1 \
    --max-size 2 \
    --desired-capacity 2 \
    --vpc-zone-identifier "${PUBLIC_SUBNET_A_ID},${PUBLIC_SUBNET_B_ID}" \
    --tags "ResourceId=$ASG_NAME,ResourceType=auto-scaling-group,Key=Role,Value=WebServer,PropagateAtLaunch=true"

# Get auto scaling group infomation
aws autoscaling describe-auto-scaling-groups \
--auto-scaling-group-name $ASG_NAME
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "da-c03-asg",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:421117346104:autoScalingGroup:40c1837f-9dcc-47f6-bf12-0254d3bf04a9:autoScalingGroupName
/da-c03-asg",
            "LaunchConfigurationName": "da-c03-asg-cfg",
            "MinSize": 1,
            "MaxSize": 2,
            "DesiredCapacity": 2,
            "DefaultCooldown": 300,
            "AvailabilityZones": [
                "ap-southeast-2b",
                "ap-southeast-2a"
            ],
            "LoadBalancerNames": [],
            "TargetGroupARNs": [],
            "HealthCheckType": "EC2",
            "HealthCheckGracePeriod": 0,
            "Instances": [
                {
                    "InstanceId": "i-0744f3348b7bcf0df",
                    "InstanceType": "t2.micro",
                    "AvailabilityZone": "ap-southeast-2b",
                    "LifecycleState": "Pending",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "da-c03-asg-cfg",
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-0c4076d13c188b841",
                    "InstanceType": "t2.micro",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "Pending",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "da-c03-asg-cfg",
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-09-05T03:23:37.196000+00:00",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-04709dce111382a62,subnet-00d8a496401ddc8de",
            "EnabledMetrics": [],
            "Tags": [
                {
                    "ResourceId": "da-c03-asg",
                    "ResourceType": "auto-scaling-group",
                    "Key": "Role",
                    "Value": "WebServer",
                    "PropagateAtLaunch": true
                }
            ],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::421117346104:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}

```

- Command used to get each asg instance hostname through the webserver
```bash
aws ec2 describe-instances --query 'Reservations[].Instances[].PublicIpAddress' --filters "Name=tag-value,Values=WebServer"

[
    "54.253.211.152",
    "54.206.117.17"
]

curl 54.253.211.152
ip-10-128-11-71.ap-southeast-2.compute.internal

curl 54.206.117.17
ip-10-128-10-126.ap-southeast-2.compute.internal

```

- Details of the security group used on the asg
```bash
aws ec2 describe-security-groups --group-ids $SG_ID

{
    "SecurityGroups": [
        {
            "Description": "SSH access from home to AWS",
            "GroupName": "da-c02-public-sg",
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
                },
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "120.148.174.1/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "421117346104",
            "GroupId": "sg-03c842207ddde4f96",
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
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-public-sg"
                }
            ],
            "VpcId": "vpc-02ec2836691642ace"
        }
    ]
}

```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```

It outputs the instance metadata -hostname to the index.html, which showing the hostname of the instance by checking userdata url.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)