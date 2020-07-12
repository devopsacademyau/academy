# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
aws elbv2 create-load-balancer \
    --name LB-devopsacademy \
    --security-groups sg-0ba93234733a2660b \
    --subnets subnet-0c341aabdd7fc51d6 subnet-0300fc4a8e14db404

{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:loadbalancer/app/LB-devopsacademy/59897f9b1d2d5fcc",
            "DNSName": "LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-10T13:21:52.950000+00:00",
            "LoadBalancerName": "LB-devopsacademy",
            "Scheme": "internet-facing",
            "VpcId": "vpc-018717ea8ed22e6ae",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-0300fc4a8e14db404",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-0c341aabdd7fc51d6",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0ba93234733a2660b"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

aws elbv2 create-target-group \
    --name TG-devopsacademy \
    --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id vpc-018717ea8ed22e6ae

{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:targetgroup/TG-devopsacademy/bcfbc97908ddc68b",
            "TargetGroupName": "TG-devopsacademy",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-018717ea8ed22e6ae",
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

aws elbv2 register-targets \
    --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:targetgroup/TG-devopsacademy/bcfbc97908ddc68b \
    --targets Id=i-0ac8aee1f4cb280b8 Id=i-046ceabcf4bdc1b1a

aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:loadbalancer/app/LB-devopsacademy/59897f9b1d2d5fcc \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:targetgroup/TG-devopsacademy/bcfbc97908ddc68b

{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:listener/app/LB-devopsacademy/59897f9b1d2d5fcc/d04ea637b5744753",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:loadbalancer/app/LB-devopsacademy/59897f9b1d2d5fcc",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:targetgroup/TG-devopsacademy/bcfbc97908ddc68b",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:873547843801:targetgroup/TG-devopsacademy/bcfbc97908ddc68b",
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
aws ec2 describe-security-groups \
    --group-ids sg-0ba93234733a2660b

{
    "SecurityGroups": [
        {
            "Description": "security group for ASG",
            "GroupName": "SG-ASG-devopsacademy",
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
            "OwnerId": "873547843801",
            "GroupId": "sg-0ba93234733a2660b",
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
            "VpcId": "vpc-018717ea8ed22e6ae"
        }
    ]
}
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```

➜  academy git:(gepifanio/c03-aws02) ✗ curl LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com
ip-10-0-162-236.ap-southeast-2.compute.internal%                                                                                                           ➜  academy git:(gepifanio/c03-aws02) ✗ curl LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com
ip-10-0-222-25.ap-southeast-2.compute.internal%                                                                                                            ➜  academy git:(gepifanio/c03-aws02) ✗ curl LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com
ip-10-0-162-236.ap-southeast-2.compute.internal%                                                                                                           ➜  academy git:(gepifanio/c03-aws02) ✗ curl LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com
ip-10-0-162-236.ap-southeast-2.compute.internal%                                                                                                           ➜  academy git:(gepifanio/c03-aws02) ✗ curl LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com
ip-10-0-222-25.ap-southeast-2.compute.internal%                                                                                                            ➜  academy git:(gepifanio/c03-aws02) ✗ curl LB-devopsacademy-526560631.ap-southeast-2.elb.amazonaws.com
ip-10-0-162-236.ap-southeast-2.compute.internal%                                                                                                           ➜  academy git:(gepifanio/c03-aws02) ✗

It shows the work of the load balancer, basically it is doing round robin sending the curl request to the differents instances.


```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)