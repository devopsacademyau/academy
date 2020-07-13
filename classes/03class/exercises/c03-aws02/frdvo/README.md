# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
$ aws elbv2 create-load-balancer --name DA-ALB --subnets subnet-01f6ba32065d77e19 subnet-04843486979b4aeb2 --security-groups sg-02e5524e6dbdd5cbd
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:loadbalancer/app/DA-ALB/5799d906f2f17af7",
            "DNSName": "DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-13T11:54:33.730Z",
            "LoadBalancerName": "DA-ALB",
            "Scheme": "internet-facing",
            "VpcId": "vpc-0a2b7db4956438d22",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2c",
                    "SubnetId": "subnet-01f6ba32065d77e19",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-04843486979b4aeb2",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-02e5524e6dbdd5cbd"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

```

- Details of the security group used
```
$ aws ec2 describe-security-groups --group-ids sg-02e5524e6dbdd5cbd
{
    "SecurityGroups": [
        {
            "Description": "port 80 from internet",
            "GroupName": "Autoscaling-SG",
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
            "OwnerId": "165765640813",
            "GroupId": "sg-02e5524e6dbdd5cbd",
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
            "VpcId": "vpc-0a2b7db4956438d22"
        }
    ]
}

$ aws elbv2 describe-load-balancers
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:loadbalancer/app/DA-ALB/5799d906f2f17af7",
            "DNSName": "DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-13T11:54:33.730Z",
            "LoadBalancerName": "DA-ALB",
            "Scheme": "internet-facing",
            "VpcId": "vpc-0a2b7db4956438d22",
            "State": {
                "Code": "active"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2c",
                    "SubnetId": "subnet-01f6ba32065d77e19",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-04843486979b4aeb2",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-02e5524e6dbdd5cbd"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

$ aws elbv2 create-target-group --name DA-ALB-TG --protocol HTTP --port 80 --vpc-id vpc-0a2b7db4956438d22
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:targetgroup/DA-ALB-TG/7f059fad31523bf8",
            "TargetGroupName": "DA-ALB-TG",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-0a2b7db4956438d22",
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

$ aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:targetgroup/DA-ALB-TG/7f059fad31523bf8 --targets Id=i-088d7819d1a7fabca Id=i-0f9384988f3c6605d

$ aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:loadbalancer/app/DA-ALB/5799d906f2f17af7 --protocol HTTP --port 80  --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:targetgroup/DA-ALB-TG/7f059fad31523bf8

$ aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:loadbalancer/app/DA-ALB/5799d906f2f17af7 --protocol HTTP --port 80  --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:targetgroup/DA-ALB-TG/7f059fad31523bf8
{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:listener/app/DA-ALB/5799d906f2f17af7/ab3073ee59ac4742",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:loadbalancer/app/DA-ALB/5799d906f2f17af7",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:targetgroup/DA-ALB-TG/7f059fad31523bf8",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:165765640813:targetgroup/DA-ALB-TG/7f059fad31523bf8",
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

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
$ curl DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com
ip-172-16-110-158.ap-southeast-2.compute.internal

$ curl DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com
ip-172-16-110-158.ap-southeast-2.compute.internal

$ curl DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com
ip-172-16-130-199.ap-southeast-2.compute.internal

$ curl DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com
ip-172-16-110-158.ap-southeast-2.compute.internal

$ curl DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com
ip-172-16-130-199.ap-southeast-2.compute.internal

The LB is forwarding the requests to a different server each time. 

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)