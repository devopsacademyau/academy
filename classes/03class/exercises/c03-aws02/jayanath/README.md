# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
## Create the ALB
> aws elbv2 create-load-balancer \
    --name doa-alb \
    --security-groups sg-06f9585a118ad6821 \
    --subnets subnet-05ba54dadeae3a83c subnet-068196b22d394d652

    {
        "LoadBalancers": [
            {
                "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:loadbalancer/app/doa-alb/a7bfff31e9d009b3",
                "DNSName": "doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com",
                "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
                "CreatedTime": "2020-07-08T11:28:07.730000+00:00",
                "LoadBalancerName": "doa-alb",
                "Scheme": "internet-facing",
                "VpcId": "vpc-007774900b7f4c596",
                "State": {
                    "Code": "provisioning"
                },
                "Type": "application",
                "AvailabilityZones": [
                    {
                        "ZoneName": "ap-southeast-2a",
                        "SubnetId": "subnet-05ba54dadeae3a83c",
                        "LoadBalancerAddresses": []
                    },
                    {
                        "ZoneName": "ap-southeast-2b",
                        "SubnetId": "subnet-068196b22d394d652",
                        "LoadBalancerAddresses": []
                    }
                ],
                "SecurityGroups": [
                    "sg-06f9585a118ad6821"
                ],
                "IpAddressType": "ipv4"
            }
        ]
    }

## Create the target group
> aws elbv2 create-target-group \
    --name doa-asg-targets \
    --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id vpc-007774900b7f4c596

    {
        "TargetGroups": [
            {
                "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:targetgroup/doa-asg-targets/bbddcd94206b2f86",
                "TargetGroupName": "doa-asg-targets",
                "Protocol": "HTTP",
                "Port": 80,
                "VpcId": "vpc-007774900b7f4c596",
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

## Register instances to the target group
> aws elbv2 register-targets \
    --target-group-arn "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:targetgroup/doa-asg-targets/bbddcd94206b2f86" \
    --targets Id=i-00e6b4211bf63f322 Id=i-020de45d3967b3e89

## Create the HTTP listener
> aws elbv2 create-listener \
    --load-balancer-arn "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:loadbalancer/app/doa-alb/a7bfff31e9d009b3" \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:targetgroup/doa-asg-targets/bbddcd94206b2f86

    {
        "Listeners": [
            {
                "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:listener/app/doa-alb/a7bfff31e9d009b3/cfaf454d2db9dc5c",
                "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:loadbalancer/app/doa-alb/a7bfff31e9d009b3",
                "Port": 80,
                "Protocol": "HTTP",
                "DefaultActions": [
                    {
                        "Type": "forward",
                        "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:targetgroup/doa-asg-targets/bbddcd94206b2f86",
                        "ForwardConfig": {
                            "TargetGroups": [
                                {
                                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:targetgroup/doa-asg-targets/bbddcd94206b2f86",
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
I used the same security group from the previous exercise (c03-aws01) which allows ingress on port 80 from anywhere.

```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
ALB receives the traffic from the curl request and forward them to the EC2
instances in the target group.

➜  jay curl doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com
ip-192-168-147-77.ap-southeast-2.compute.internal%

➜  jay curl doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com
ip-192-168-103-107.ap-southeast-2.compute.internal%

➜  jay curl doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com
ip-192-168-147-77.ap-southeast-2.compute.internal%

➜  jay curl doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com
ip-192-168-103-107.ap-southeast-2.compute.internal%

➜  jay curl doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com
ip-192-168-103-107.ap-southeast-2.compute.internal%

➜  jay curl doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com
ip-192-168-147-77.ap-southeast-2.compute.internal%

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)