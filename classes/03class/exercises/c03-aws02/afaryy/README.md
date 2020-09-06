# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
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

SG_NAME='da-c02-public-sg' # ASG instance SG
SG_ID=$(aws ec2 describe-security-groups  \
    --filter "Name=tag:Name,Values=$SG_NAME" \
    --query "SecurityGroups[0].GroupId" \
    --output text);
echo $SG_ID #sg-03c842207ddde4f96

ASG_NAME="da-c03-asg"
ALB_NAME='da-c03-elb'
TG_NAME='da-c03-tg'

# Creat ALB security group
ALB_SG_NAME='da-c03-elb-sg'
ALB_SG_ID=$(aws ec2 create-security-group \
    --group-name $ALB_SG_NAME \
    --description 'SSH access from home to AWS' \
    --vpc-id $VPC_ID \
    --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=$ALB_SG_NAME}]" \
    --query GroupId --output text)
echo $ALB_SG_ID #sg-0071bd92c78cf5467

aws ec2 authorize-security-group-ingress \
    --group-id $ALB_SG_ID \
    --protocol tcp \
    --port 80 \
    --cidr '0.0.0.0/0'

# Update ASG security group   
aws ec2 revoke-security-group-ingress --group-id $SG_ID --protocol tcp --port 80 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
    --group-id $SG_ID \
    --protocol tcp \
    --port 80 \
    --source-group $ALB_SG_ID 


# Create load balancer
aws elbv2 create-load-balancer \
    --type application \
    --name $ALB_NAME \
    --scheme internet-facing \
    --subnets $PUBLIC_SUBNET_A_ID $PUBLIC_SUBNET_B_ID \
    --security-groups $ALB_SG_ID \
    --tags "Key=Name,Value=$ALB_NAME"

{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:loadbalancer/app/da-c03-elb/7fac8f3e640bc61c",
            "DNSName": "da-c03-elb-787858567.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-09-05T10:17:45.300000+00:00",
            "LoadBalancerName": "da-c03-elb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-02ec2836691642ace",
            "State": {
                "Code": "provisioning"
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-00d8a496401ddc8de",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-04709dce111382a62",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0071bd92c78cf5467"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

ALB_ARN="arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:loadbalancer/app/da-c03-elb/7fac8f3e640bc61c"

aws elbv2 create-target-group \
    --name $TG_NAME \
    --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id $VPC_ID

{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:targetgroup/da-c03-tg/f7843a4372b6e93a",
            "TargetGroupName": "da-c03-tg",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-02ec2836691642ace",
            "HealthCheckProtocol": "HTTP",
            "HealthCheckPort": "traffic-port",
            "HealthCheckEnabled": true,
            "HealthCheckIntervalSeconds": 30,
            "HealthCheckTimeoutSeconds": 5,
            "HealthyThresholdCount": 5,
            "UnhealthyThresholdCount": 2,
            "HealthCheckPath": "/",
            "Matcher": {
                "HttpCode": "200"
            },
            "TargetType": "instance"
        }
    ]
}

TG_ARN="arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:targetgroup/da-c03-tg/f7843a4372b6e93a"

aws autoscaling attach-load-balancer-target-groups \
    --auto-scaling-group-name $ASG_NAME \
    --target-group-arns  $TG_ARN 

aws elbv2 create-listener \
    --load-balancer-arn $ALB_ARN \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=$TG_ARN 

{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:listener/app/da-c03-elb/7fac8f3e640bc61c/5aa3123863fa417d",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:loadbalancer/app/da-c03-elb/7fac8f3e640bc61c",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:targetgroup/da-c03-tg/f7843a4372b6e93a",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:targetgroup/da-c03-tg/f7843a4372b6e93a",
                                "Weight": 1
                            }
                        ],
                        "TargetGroupStickinessConfig": {
                            "Enabled": false
                        }
                    }
                }
            ]
        }
    ]
}

```

- Details of the security group used
```bash
# ELB security group
aws ec2 describe-security-groups --group-ids $ALB_SG_ID --output json

{
    "SecurityGroups": [
        {
            "Description": "SSH access from home to AWS",
            "GroupName": "da-c03-elb-sg",
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
            "OwnerId": "421117346104",
            "GroupId": "sg-0071bd92c78cf5467",
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
                    "Value": "da-c03-elb-sg"
                }
            ],
            "VpcId": "vpc-02ec2836691642ace"
        }
    ]
}

# ASG instance security group
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
                    "IpRanges": [],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": [
                        {
                            "GroupId": "sg-0071bd92c78cf5467",
                            "UserId": "421117346104"
                        }
                    ]
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

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```bash
ALB_CNAME="da-c03-elb-787858567.ap-southeast-2.elb.amazonaws.com"
N=6

for (( c=1; c<=N; c++ )); do curl -w "\n" $ALB_CNAME; done
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal

The ALB directs HTTP traffic to different instances by random way..

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)