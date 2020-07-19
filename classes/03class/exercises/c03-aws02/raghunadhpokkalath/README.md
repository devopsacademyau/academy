# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
Create an internet facing load balanceer

> aws elbv2  create-load-balancer --name devopsacademylb --subnets subnet-0ff0ad4440d0df64e subnet-0f3eb7a49a103114e --security-groups sg-0cf92adc7a459216c --scheme internet-facing

{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:loadbalancer/app/devopsacademylb/2dc8bed1a59347bf",
            "DNSName": "devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-14T13:01:20.610000+00:00",
            "LoadBalancerName": "devopsacademylb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-076a05ec0f3be4895",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-0f3eb7a49a103114e",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-0ff0ad4440d0df64e",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0cf92adc7a459216c"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

Create a target group for HTTP

>aws elbv2 create-target-group --name devopsacademytg --protocol HTTP 
--port 80 --target-type instance 
--vpc-id vpc-076a05ec0f3be4895

{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:targetgroup/devopsacademytg/dc98440db566c8a0",
            "TargetGroupName": "devopsacademytg",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-076a05ec0f3be4895",
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

Register Two EC2 instances as Targets 

>aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:targetgroup/devopsacademytg/dc98440db566c8a0 --targets Id=i-04de723f69840ba4c Id=i-09572d54f7ebdae6e


Create listerner for http 80 port and assign target group forward

>aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:loadbalancer/app/devopsacademylb/2dc8bed1a59347bf --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:targetgroup/devopsacademytg/dc98440db566c8a0

{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:listener/app/devopsacademylb/2dc8bed1a59347bf/fdde7ece9f0c9b0e",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:loadbalancer/app/devopsacademylb/2dc8bed1a59347bf",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:targetgroup/devopsacademytg/dc98440db566c8a0",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:361529347535:targetgroup/devopsacademytg/dc98440db566c8a0",
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
Used the security group created in previous lab to allow 80 traffic
> aws ec2 describe-security-groups --group-ids sg-0cf92adc7a459216c

{
    "SecurityGroups": [
        {
            "Description": "devopsacademy asg sg port80",
            "GroupName": "devopsacademy-sg",
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
            "OwnerId": "361529347535",
            "GroupId": "sg-0cf92adc7a459216c",
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
            "VpcId": "vpc-076a05ec0f3be4895"
        }
    ]
}
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
> curl devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com
ip-10-0-201-194.ap-southeast-2.compute.internal%
> curl devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com
ip-10-0-201-194.ap-southeast-2.compute.internal% 
> curl devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com
ip-10-0-101-215.ap-southeast-2.compute.internal
> curl devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com
ip-10-0-201-194.ap-southeast-2.compute.internal%  
> curl devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com
ip-10-0-101-215.ap-southeast-2.compute.internal%     

From the logs we can see load balancer is routing traffice to both instances  that we have created in two different avaialbity zones

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)