# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```bash
# Get subnets
❯ aws ec2 describe-subnets \
--query "Subnets[*].[SubnetId]" \
--output=text
subnet-a50917ec
subnet-f1fc63a9
subnet-d2779ab4

# Get SG
❯ aws ec2 describe-security-groups \
--group-ids sg-095154c98505dbfb4 \
--query "SecurityGroups[*].GroupId" \
--output=text
sg-095154c98505dbfb4

# Create load balancer
❯ aws elbv2 create-load-balancer \
--name facp-load-balancer  \
--subnets subnet-d2779ab4 subnet-a50917ec \
--security-groups sg-095154c98505dbfb4 \
--scheme internet-facing \
--type application
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:loadbalancer/app/facp-load-balancer/6e6871e95c7e2da9",
            "DNSName": "facp-load-balancer-1281510107.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-16T01:11:53.740Z",
            "LoadBalancerName": "facp-load-balancer",
            "Scheme": "internet-facing",
            "VpcId": "vpc-8beeebec",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-a50917ec",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-d2779ab4",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-095154c98505dbfb4"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

# Get VPC
❯ aws ec2 describe-vpcs --query "Vpcs[*].VpcId" --output=text
vpc-8beeebec

# create-target-group
❯ aws elbv2 create-target-group \
--name facp-targets \
--protocol HTTP \
--port 80 \
--target-type instance \
--vpc-id vpc-8beeebec
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:targetgroup/facp-targets/075dc8f59fe66304",
            "TargetGroupName": "facp-targets",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-8beeebec",
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

# Create listener
❯ aws elbv2 create-listener \
--load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:loadbalancer/app/facp-load-balancer/6e6871e95c7e2da9 \
--protocol HTTP \
--port 80 \
--default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:targetgroup/facp-targets/075dc8f59fe66304
{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:listener/app/facp-load-balancer/6e6871e95c7e2da9/f8e2c2c80870cf19",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:loadbalancer/app/facp-load-balancer/6e6871e95c7e2da9",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:targetgroup/facp-targets/075dc8f59fe66304"
                }
            ]
        }
    ]
}

# Get instances
❯ aws autoscaling describe-auto-scaling-groups \
--auto-scaling-group-name facp-auto-scaling-group \
--query "AutoScalingGroups[*].Instances[*].[InstanceId]" \
--output=text
i-020306367920ba80c
i-0e19866a7b6e47962

# Register targets
❯ aws elbv2 register-targets \
--target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:978009416274:targetgroup/facp-targets/075dc8f59fe66304 \
--targets Id=i-0e19866a7b6e47962 Id=i-020306367920ba80c

```

- Details of the security group used
```bash
❯ aws ec2 describe-security-groups \
    --group-ids sg-095154c98505dbfb4
{
    "SecurityGroups": [
        {
            "Description": "SG for exercise C03-aws01",
            "GroupName": "facp-sg-C03-aws01",
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
            "OwnerId": "978009416274",
            "GroupId": "sg-095154c98505dbfb4",
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
            "VpcId": "vpc-8beeebec"
        }
    ]
}
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
❯ curl facp-load-balancer-1281510107.ap-southeast-2.elb.amazonaws.com
ip-172-31-6-239.ap-southeast-2.compute.internal

❯ curl facp-load-balancer-1281510107.ap-southeast-2.elb.amazonaws.com
ip-172-31-44-35.ap-southeast-2.compute.internal

❯ curl facp-load-balancer-1281510107.ap-southeast-2.elb.amazonaws.com
ip-172-31-6-239.ap-southeast-2.compute.internal

❯ curl facp-load-balancer-1281510107.ap-southeast-2.elb.amazonaws.com
ip-172-31-44-35.ap-southeast-2.compute.internal

I can see the load balancer distributing the traffic between the instances ip-172-31-6-239.ap-southeast-2.compute.internal and ip-172-31-44-35.ap-southeast-2.compute.internal.
```

Resources
[elbv2](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/elbv2/index.html)
[create-load-balancer](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/elbv2/create-load-balancer.html)
[create-target-group](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/elbv2/create-target-group.html)
[create-listener](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/elbv2/create-listener.html)
[register-targets](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/elbv2/register-targets.html)


<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)