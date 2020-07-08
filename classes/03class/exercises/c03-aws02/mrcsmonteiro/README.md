# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
$ aws elbv2 create-load-balancer \
    --type application \
    --name devops-academy-alb \
    --subnets subnet-012cc488da2a78bcd subnet-01c5db45e8f5eda43 subnet-0f04d5a771b8895fd \
    --scheme internet-facing \
    --security-groups sg-010e9583a629eae27 \
    --tags "Key=Name,Value=DevOps Academy ALB"

{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:loadbalancer/app/devops-academy-alb/d706929f7cd85a67",
            "DNSName": "devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-08T02:30:36.830000+00:00",
            "LoadBalancerName": "devops-academy-alb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-0721e28436cea8410",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-012cc488da2a78bcd",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-01c5db45e8f5eda43",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2c",
                    "SubnetId": "subnet-0f04d5a771b8895fd",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-010e9583a629eae27"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

$ aws elbv2 create-target-group \
    --name devops-academy-tg \
    --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id vpc-0721e28436cea8410

{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:targetgroup/devops-academy-tg/16871e3110304536",
            "TargetGroupName": "devops-academy-tg",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-0721e28436cea8410",
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

$ aws elbv2 add-tags \
    --resource-arns arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:targetgroup/devops-academy-tg/16871e3110304536 \
    --tags "Key=Name,Value=DevOps Academy TG"

$ aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:loadbalancer/app/devops-academy-alb/d706929f7cd85a67 \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:targetgroup/devops-academy-tg/16871e3110304536

{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:listener/app/devops-academy-alb/d706929f7cd85a67/c600e5ca31b516e4",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:loadbalancer/app/devops-academy-alb/d706929f7cd85a67",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:targetgroup/devops-academy-tg/16871e3110304536",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:targetgroup/devops-academy-tg/16871e3110304536",
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

$ aws autoscaling attach-load-balancer-target-groups \
    --auto-scaling-group-name devops-academy-asg \
    --target-group-arns arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:targetgroup/devops-academy-tg/16871e3110304536
```

- Details of the security group used
```
$ aws ec2 describe-security-groups \
    --group-ids sg-010e9583a629eae27

{
    "SecurityGroups": [
        {
            "Description": "DevOps Academy security group for HTTP traffic",
            "GroupName": "devops-academy-http-sg",
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
            "OwnerId": "149613515908",
            "GroupId": "sg-010e9583a629eae27",
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
                    "Value": "DevOps Academy HTTP SG"
                }
            ],
            "VpcId": "vpc-0721e28436cea8410"
        }
    ]
}
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-33-36.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-11-60.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-33-36.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-11-60.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-33-36.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-11-60.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-33-36.ap-southeast-2.compute.internal
$ curl devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com
ip-10-11-33-36.ap-southeast-2.compute.internal

- I see the ALB distributing HTTP traffic over the instances launched by the ASG attached to the ALB's Target Group, in a 'Round-robin' fashion (load is assigned to target instances in equal portions and in circular order, without priority).
```

***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
