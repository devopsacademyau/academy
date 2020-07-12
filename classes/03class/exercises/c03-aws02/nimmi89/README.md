# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
> Command to create load balancer
aws elbv2 create-load-balancer --name my-load-balancer  \
--subnets subnet-062c79f06460c35c1 subnet-07debbb9f04cb105c --security-groups sg-005dc45ad043be6c1
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:loadbalancer/app/my-load-balancer/c73a2084dae67ce8",
            "DNSName": "my-load-balancer-203056255.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-11T11:23:54.500000+00:00",
            "LoadBalancerName": "my-load-balancer",
            "Scheme": "internet-facing",
            "VpcId": "vpc-081afcee350babdf5",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-062c79f06460c35c1",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-07debbb9f04cb105c",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-005dc45ad043be6c1"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

 > Command to create target group
aws elbv2 create-target-group \
    --name DA-targets --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id vpc-081afcee350babdf5
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:targetgroup/DA-targets/95c890365deb9657",
            "TargetGroupName": "DA-targets",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-081afcee350babdf5",
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

> Command to register your instances with your target group
aws elbv2 register-targets \
    --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:targetgroup/DA-targets/95c890365deb9657 \
    --targets Id=i-073c18d845b092950 Id=i-09b699355152b2618

> Command to create a listener for your load balancer with a default rule that forwards requests to your target group
aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:loadbalancer/app/my-load-balancer/c73a2084dae67ce8 \
    --protocol HTTP --port 80  \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:targetgroup/DA-targets/95c890365deb9657
{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:listener/app/my-load-balancer/c73a2084dae67ce8/ce4febf3829a04d0",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:loadbalancer/app/my-load-balancer/c73a2084dae67ce8",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:targetgroup/DA-targets/95c890365deb9657",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:targetgroup/DA-targets/95c890365deb9657",
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

> Command to verify the health of the registered targets for your target group
aws elbv2 describe-target-health --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:438549961569:targetgroup/DA-targets/95c890365deb9657
{
    "TargetHealthDescriptions": [
        {
            "Target": {
                "Id": "i-073c18d845b092950",
                "Port": 80
            },
            "HealthCheckPort": "80",
            "TargetHealth": {
                "State": "healthy"
            }
        },
        {
            "Target": {
                "Id": "i-09b699355152b2618",
                "Port": 80
            },
            "HealthCheckPort": "80",
            "TargetHealth": {
                "State": "healthy"
            }
        }
    ]
}

```

- Details of the security group used
```
aws ec2 describe-security-groups \   
    --group-ids  sg-005dc45ad043be6c1 

{
    "SecurityGroups": [
        {
            "Description": "Class 3 Apache security group",
            "GroupName": "ApacheSecurityGroup",
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
            "OwnerId": "438549961569",
            "GroupId": "sg-005dc45ad043be6c1",
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
            "VpcId": "vpc-081afcee350babdf5"
        }
    ]
}

```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
curl my-load-balancer-203056255.ap-southeast-2.elb.amazonaws.com
>ip-172-16-25-226.ap-southeast-2.compute.internal
curl my-load-balancer-203056255.ap-southeast-2.elb.amazonaws.com
ip-172-16-87-149.ap-southeast-2.compute.internal
>curl my-load-balancer-203056255.ap-southeast-2.elb.amazonaws.com
ip-172-16-87-149.ap-southeast-2.compute.internal
>curl my-load-balancer-203056255.ap-southeast-2.elb.amazonaws.com
ip-172-16-87-149.ap-southeast-2.compute.internal

The load balancer distributes incoming application traffic across multiple targets, such as EC2 instances, in multiple Availability Zones. A listener checks for connection requests from clients, using the protocol and port that you configure. The rules that you define for a listener determine how the load balancer routes requests to its registered targets.Each target group routes requests to one or more registered targets, such as EC2 instances, using the protocol and port number that you specify
Thats why our instances[Target group] serving as webservers returning their respective hostnames is displayed randomly on every curl request to the ALB.

```


***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)