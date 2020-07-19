# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
Create a security group and allow connections to Port 80 from all ip

> aws ec2 create-security-group --vpc-id vpc-076a05ec0f3be4895 --group-name devopsacademy-sg --description "devopsacademy asg sg port80"
{
    "GroupId": "sg-0cf92adc7a459216c"
}
> aws ec2  authorize-security-group-ingress --group-id sg-0cf92adc7a459216c --protocol tcp --port 80 --cidr 0.0.0.0/0


Create a Launch configuration for ASG with  userdata to start httpserver


> aws autoscaling create-launch-configuration --launch-configuration-name devopsacadmy-asg-launch-config --user-data file://userdata.txt --security-groups sg-0cf92adc7a459216c --image-id  ami-0a58e22c727337c51  --instance-type t2.nano --key-name EC2KeyPair --associate-public-ip-address

> more userdata.txt
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd

> aws autoscaling    create-auto-scaling-group --auto-scaling-group-name devopsacadmy-asg --launch-configuration-name  devopsacadmy-asg-launch-config --min-size 1 --max-size 2  --desired-capacity 2 --vpc-zone-identifier subnet-0f3eb7a49a103114e,subnet-0ff0ad4440d0df64e

Verify autoscaling completed and instances are created
> aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name devopsacadmy-asg 
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "devopsacadmy-asg",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:361529347535:autoScalingGroup:8899db65-8167-4ac3-b040-aedc0372c971:autoScalingGroupName/devopsacadmy-asg",
            "LaunchConfigurationName": "devopsacadmy-asg-launch-config",
            "MinSize": 1,
            "MaxSize": 2,
            "DesiredCapacity": 2,
            "DefaultCooldown": 300,
            "AvailabilityZones": [
                "ap-southeast-2b",
                "ap-southeast-2a"
            ],
            "LoadBalancerNames": [],
            "TargetGroupARNs": [],
            "HealthCheckType": "EC2",
            "HealthCheckGracePeriod": 0,
            "Instances": [
                {
                    "InstanceId": "i-0b577c6727cdd496b",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2b",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "devopsacadmy-asg-launch-config",
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-0b601e4a953635c4f",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "devopsacadmy-asg-launch-config",
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-07-12T06:20:57.032000+00:00",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-0f3eb7a49a103114e,subnet-0ff0ad4440d0df64e",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::361529347535:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}

```

- Command used to get each asg instance hostname through the webserver
```
First instance (Public Subnet 2A)
ip-10-0-101-172.ap-southeast-2.compute.internal%    
Second Instance (Public Subnet 2B)
>curl http://3.25.132.173/
ip-10-0-201-213.ap-southeast-2.compute.internal% 

```

- Details of the security group used on the asg
```
> aws ec2 describe-security-group sg-0cf92adc7a459216c

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

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
This will help to get all categories of instance metadata from within a running instance and the output is written to index html.The ip address 169.254.169.254 is a link-local address and is valid only from the instance.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)