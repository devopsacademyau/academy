# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)


```
From previous exercise:
#Security group: `create a new one to allow connection from anywhere to port 80`
z@bacon:~$ aws ec2 create-security-group  --group-name Autoscaling-group-c03   --description "create a security group to allow connection from anywhere to port 80"  --vpc-id vpc-09d2f2719d50d1f7f
{
    "GroupId": "sg-0b91305354d705dbb"
}

#create instances
z@bacon:~$ aws ec2 describe-instances     --query 'Reservations[*].Instances[*].{Instance:InstanceId,Subnet:SubnetId,PublicIP:PublicIpAddress}'     --output json
[
    [
        {
            "Instance": "i-051bfa1e0f24b4f91",
            "Subnet": "subnet-0abbcb057289b670d",
            "PublicIP": "13.236.121.187"
        }
    ],
    [
        {
            "Instance": "i-0e5988470d6ad765f",
            "Subnet": "subnet-0907f22726c996fd5",
            "PublicIP": "3.25.134.255"
        }
    ]
]
```
https://docs.aws.amazon.com/cli/latest/reference/elb/create-load-balancer.html


https://docs.aws.amazon.com/elasticloadbalancing/latest/application/tutorial-application-load-balancer-cli.html


```
#create load balancer
z@bacon:~$ aws elbv2 help
z@bacon:~$ aws elbv2 create-load-balancer --name c03-alb --subnets subnet-0907f22726c996fd5 subnet-0abbcb057289b670d --security-groups sg-0b91305354d705dbb
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:loadbalancer/app/c03-alb/6a5a70ee5d6a2632",
            "DNSName": "c03-alb-767053992.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-11T02:42:31.280Z",
            "LoadBalancerName": "c03-alb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-0907f22726c996fd5",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-0abbcb057289b670d",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0b91305354d705dbb"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}
#check load balancer is active
z@bacon:~$ aws elbv2 describe-load-balancers help
z@bacon:~$ aws elbv2 describe-load-balancers --load-balancer-arns arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:loadbalancer/app/c03-alb/6a5a70ee5d6a2632
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:loadbalancer/app/c03-alb/6a5a70ee5d6a2632",
            "DNSName": "c03-alb-767053992.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-11T02:42:31.280Z",
            "LoadBalancerName": "c03-alb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "State": {
                "Code": "active"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-0907f22726c996fd5",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-0abbcb057289b670d",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0b91305354d705dbb"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}
#create target group
z@bacon:~$ aws elbv2 create-target-group --name c03-alb-target --protocol HTTP --port 80 --vpc-id vpc-09d2f2719d50d1f7f
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:targetgroup/c03-alb-target/b42f166a2bbac7a2",
            "TargetGroupName": "c03-alb-target",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-09d2f2719d50d1f7f",
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
#Use the register-targets command to register your instances with your target group
#instances created in c03-aws01
z@bacon:~$ aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:targetgroup/c03-alb-target/b42f166a2bbac7a2 --targets Id=i-051bfa1e0f24b4f91 Id=i-0e5988470d6ad765f
#Use the create-listener command to create a listener for your load balancer with a default rule that forwards requests to your target group
z@bacon:~$ aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:loadbalancer/app/c03-alb/6a5a70ee5d6a2632 --protocol HTTP --port 80  --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:targetgroup/c03-alb-target/b42f166a2bbac7a2
{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:listener/app/c03-alb/6a5a70ee5d6a2632/e238628d4fa9de83",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:loadbalancer/app/c03-alb/6a5a70ee5d6a2632",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:targetgroup/c03-alb-target/b42f166a2bbac7a2",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:512742231244:targetgroup/c03-alb-target/b42f166a2bbac7a2",
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
z@bacon:~$ aws ec2 describe-security-groups --group-ids sg-0b91305354d705dbb
{
    "SecurityGroups": [
        {
            "Description": "create a security group to allow connection from anywhere to port 80",
            "GroupName": "Autoscaling-group-c03",
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
            "OwnerId": "512742231244",
            "GroupId": "sg-0b91305354d705dbb",
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
            "VpcId": "vpc-09d2f2719d50d1f7f"
        }
    ]
}

```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-132-153.ap-southeast-2.compute.internal
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-132-153.ap-southeast-2.compute.internal
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-132-153.ap-southeast-2.compute.internal
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-108-53.ap-southeast-2.compute.internal
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-108-53.ap-southeast-2.compute.internal
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-132-153.ap-southeast-2.compute.internal
z@bacon:~$ curl c03-alb-767053992.ap-southeast-2.elb.amazonaws.com
ip-192-168-108-53.ap-southeast-2.compute.internal
z@bacon:~$ 

#the loadbalancer is successfully switching between the two load balanced instances (though took me a second to realise as the two IPs end very similaly and i was just looking the last couple of numbers in the IP :P ). The instances are displaying their hostname, which allows us to see us connecting to both.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)