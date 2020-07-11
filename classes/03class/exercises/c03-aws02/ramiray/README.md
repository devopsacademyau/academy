# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
1. Create Load-Balancer 

$ aws elbv2 create-load-balancer --name ramyadevopsalb --subnets subnet-04c9d82c36567dcc6 subnet-0ad9dc31135c0f2d8 --security-groups sg-04c7c173261c8c2c1
{
    "LoadBalancers": [
        {
            "IpAddressType": "ipv4",
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:loadbalancer/app/ramyadevopsalb/0acea96172a5832f",
            "State": {
                "Code": "provisioning"
            },
            "DNSName": "ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com",
            "SecurityGroups": [
                "sg-04c7c173261c8c2c1"
            ],
            "LoadBalancerName": "ramyadevopsalb",
            "CreatedTime": "2020-07-09T05:01:02.040Z",
            "Scheme": "internet-facing",
            "Type": "application",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "AvailabilityZones": [
                {
                    "SubnetId": "subnet-04c9d82c36567dcc6",
                    "LoadBalancerAddresses": [],
                    "ZoneName": "ap-southeast-2a"
                },
                {
                    "SubnetId": "subnet-0ad9dc31135c0f2d8",
                    "LoadBalancerAddresses": [],
                    "ZoneName": "ap-southeast-2b"
                }
            ]
        }
    ]
}

2. $ aws elbv2 create-target-group --name devops-target  --protocol HTTP --port 80 \
> --vpc-id vpc-0351acfbc7aed9c1f
{
    "TargetGroups": [
        {
            "HealthCheckPath": "/",
            "HealthCheckIntervalSeconds": 30,
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "Protocol": "HTTP",
            "HealthCheckTimeoutSeconds": 5,
            "TargetType": "instance",
            "HealthCheckProtocol": "HTTP",
            "UnhealthyThresholdCount": 2,
            "HealthyThresholdCount": 5,
            "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:targetgroup/devops-target/7d90f8633276916c",
            "Matcher": {
                "HttpCode": "200"
            },
            "HealthCheckPort": "traffic-port",
            "Port": 80,
            "TargetGroupName": "devops-target"
        }
    ]
}

3. Register the Target group:

aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:targetgroup/devops-target/7d90f8633276916c  \
--targets Id=i-09fee876e84ebb49a Id=i-0e31255fd1104b955

4. Create Listener command:

aws elbv2 create-listener \
--load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:loadbalancer/app/ramyadevopsalb/0acea96172a5832f \
--protocol HTTP --port 80  \
--default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:targetgroup/devops-target/7d90f8633276916c

{
    "Listeners": [
        {
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:targetgroup/devops-target/7d90f8633276916c",
                    "Type": "forward"
                }
            ],
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:loadbalancer/app/ramyadevopsalb/0acea96172a5832f",
            "Port": 80,
            "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:348662207501:listener/app/ramyadevopsalb/0acea96172a5832f/f6d19e001e381c57"
        }
    ]
}

```

- Details of the security group used
```
Security group was created in the previous exercises : 

$ aws ec2 create-security-group --group-name my-devopssg --description "My security group" --vpc-id vpc-0351acfbc7aed9c1f
{
    "GroupId": "sg-04c7c173261c8c2c1"
}

$ aws ec2 authorize-security-group-ingress --group-id sg-04c7c173261c8c2c1 --protocol tcp --port 80 --cidr 0.0.0.0/0

$ aws ec2 describe-security-groups --group-ids sg-04c7c173261c8c2c1

{
    "SecurityGroups": [
        {
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "PrefixListIds": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "UserIdGroupPairs": [],
                    "Ipv6Ranges": []
                }
            ],
            "Description": "My security group",
            "IpPermissions": [
                {
                    "PrefixListIds": [],
                    "FromPort": 80,
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "ToPort": 80,
                    "IpProtocol": "tcp",
                    "UserIdGroupPairs": [],
                    "Ipv6Ranges": []
                }
            ],
            "GroupName": "my-devopssg",
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "OwnerId": "348662207501",
            "GroupId": "sg-04c7c173261c8c2c1"
        }
    ]
}


```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
$ curl ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com
    ip-172-16-40-186.ap-southeast-2.compute.internal

$ `curl ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com`
    ip-172-16-98-42.ap-southeast-2.compute.internal


$ `curl ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com`
    ip-172-16-98-42.ap-southeast-2.compute.internal


$ `curl ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com`
    ip-172-16-40-186.ap-southeast-2.compute.internal

$ `curl ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com`
    ip-172-16-40-186.ap-southeast-2.compute.internal: command not found

ALB is sending traffic to both the ec2 and the curl command retrieve the ip from the metadata. 

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)