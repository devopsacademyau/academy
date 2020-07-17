# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
SUBNET_A=subnet-0d4986c79f7cd8e16
SUBNET_B=subnet-0e2e2f2420e06f0c0
VPC=vpc-0b374a631c3066687
ASG=da-asg
SG=sg-02faf9407850a815f

$ aws elbv2 create-load-balancer --name c03-aws02 --subnets $SUBNET_A $SUBNET_B --security-groups $SG
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:loadbalancer/app/c03-aws02/e53422cb883864b3",
            "DNSName": "c03-aws02-293708117.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-17T05:41:54.120000+00:00",
            "LoadBalancerName": "c03-aws02",
            "Scheme": "internet-facing",
            "VpcId": "vpc-0b374a631c3066687",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2c",
                    "SubnetId": "subnet-0d4986c79f7cd8e16",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-0e2e2f2420e06f0c0",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-02faf9407850a815f"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

$ aws elbv2 create-target-group --name c03-aws02 --protocol HTTP --port 80 --vpc-id $VPC
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:targetgroup/c03-aws02/c3568dc46937e644",
            "TargetGroupName": "c03-aws02",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-0b374a631c3066687",
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

$ aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name da-asg --target-group-arns arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:targetgroup/c03-aws02/c3568dc46937e644

$ aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:loadbalancer/app/c03-aws02/e53422cb883864b3 --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:targetgroup/c03-aws02/c3568dc46937e644
{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:listener/app/c03-aws02/e53422cb883864b3/47a4b8c40c95b297",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:loadbalancer/app/c03-aws02/e53422cb883864b3",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:targetgroup/c03-aws02/c3568dc46937e644",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:073145331885:targetgroup/c03-aws02/c3568dc46937e644",
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
```
ALB SG allows:
- HTTP ingress from anywhere
- HTTP egress only to ASG instances

ASG SG allows:
- HTTP ingress only to ALB

$ aws ec2 describe-security-groups --group-ids sg-0d39156c72d374a9c sg-02faf9407850a815f | pbcopy
{
    "SecurityGroups": [
        {
            "Description": "Allow HTTP from ALB",
            "GroupName": "c03-aws01",
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
                            "Description": "Allow ASG",
                            "GroupId": "sg-02faf9407850a815f",
                            "UserId": "073145331885"
                        }
                    ]
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
        },
        {
            "Description": "Allow requests via ALB",
            "GroupName": "c03-aws02",
            "IpPermissions": [
                {
                    "FromPort": 80,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0",
                            "Description": "Allow public HTTP"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "073145331885",
            "GroupId": "sg-02faf9407850a815f",
            "IpPermissionsEgress": [
                {
                    "FromPort": 80,
                    "IpProtocol": "tcp",
                    "IpRanges": [],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": [
                        {
                            "Description": "Allow ALB to reach backend",
                            "GroupId": "sg-0d39156c72d374a9c",
                            "UserId": "073145331885"
                        }
                    ]
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "c03-aws02"
                }
            ],
            "VpcId": "vpc-0b374a631c3066687"
        }
    ]
}


```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
LB=c03-aws02-293708117.ap-southeast-2.elb.amazonaws.com

$ for _ in {1..10}; do curl -w "\n" $LB; done
ip-10-42-20-150.ap-southeast-2.compute.internal
ip-10-42-20-150.ap-southeast-2.compute.internal
ip-10-42-21-9.ap-southeast-2.compute.internal
ip-10-42-21-9.ap-southeast-2.compute.internal
ip-10-42-20-150.ap-southeast-2.compute.internal
ip-10-42-21-9.ap-southeast-2.compute.internal
ip-10-42-20-150.ap-southeast-2.compute.internal
ip-10-42-20-150.ap-southeast-2.compute.internal
ip-10-42-21-9.ap-southeast-2.compute.internal
ip-10-42-21-9.ap-southeast-2.compute.internal

Sometimes it hits one instance, sometimes another (as expected).
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)