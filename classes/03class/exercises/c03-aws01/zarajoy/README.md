# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:

https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html

https://docs.aws.amazon.com/cli/latest/reference/autoscaling/create-launch-configuration.html

https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-from-instance.html


|SubnetID | Subnet Address | Host Address Range | Public/Private | SubnetID | RT |
|-|-|-|-|-| - |
|4|192.168.96.0/19|192.168.96.1 - 192.168.127.254|Public-a|subnet-0907f22726c996fd5| rtb-07a9d3ac37a9cb8e0
|5|192.168.128.0/19 |192.168.128.1 - 192.168.159.254|Public-b|subnet-0abbcb057289b670d| rtb-07a9d3ac37a9cb8e0

```
#Security group: `create a new one to allow connection from anywhere to port 80`
z@bacon:~$ aws ec2 create-security-group  --group-name Autoscaling-group-c03   --description "create a security group to allow connection from anywhere to port 80"  --vpc-id vpc-09d2f2719d50d1f7f
{
    "GroupId": "sg-0b91305354d705dbb"
}
z@bacon:~$ aws ec2 authorize-security-group-ingress  --group-id sg-0b91305354d705dbb  --ip-permissions IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges=[{CidrIp=0.0.0.0/0}]
z@bacon:~$ aws ec2 describe-security-groups  --group-ids sg-0b91305354d705dbb
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
z@bacon:~$ aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.????????.?-x86_64-gp2' 'Name=state,Values=available' --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' --output text
ami-0a58e22c727337c51

z@bacon:~$ aws autoscaling create-launch-configuration --launch-configuration-name DoA-c03-launchconfig --image-id ami-0a58e22c727337c51 --instance-type t2.nano --security-groups sg-0b91305354d705dbb --user-data file://userdata-c03.txt --associate-public-ip-address 
z@bacon:~$ aws autoscaling describe-launch-configurations
{
    "LaunchConfigurations": [
        {
            "LaunchConfigurationName": "DoA-c03-launchconfig",
            "LaunchConfigurationARN": "arn:aws:autoscaling:ap-southeast-2:512742231244:launchConfiguration:fa7531ba-f7ae-4c27-a1c9-f9cf2a3c5018:launchConfigurationName/DoA-c03-launchconfig",
            "ImageId": "ami-0a58e22c727337c51",
            "KeyName": "",
            "SecurityGroups": [
                "sg-0b91305354d705dbb"
            ],
            "ClassicLinkVPCSecurityGroups": [],
            "UserData": "IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQK",
            "InstanceType": "t2.nano",
            "KernelId": "",
            "RamdiskId": "",
            "BlockDeviceMappings": [],
            "InstanceMonitoring": {
                "Enabled": true
            },
            "CreatedTime": "2020-07-10T09:32:36.856Z",
            "EbsOptimized": false,
            "AssociatePublicIpAddress": true
        }
    ]
}

z@bacon:~$   aws autoscaling create-auto-scaling-group  --auto-scaling-group-name asg-c03 --launch-configuration-name  DoA-c03-launchconfig  --min-size 1 --max-size 2 --desired-capacity 2    --vpc-zone-identifier "subnet-0907f22726c996fd5,subnet-0abbcb057289b670d"
z@bacon:~$ aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name asg-c03
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "asg-c03",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:512742231244:autoScalingGroup:373cfdad-8d71-4e9a-ae33-0492f339aca9:autoScalingGroupName/asg-c03",
            "LaunchConfigurationName": "DoA-c03-launchconfig",
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
            "Instances": [],
            "CreatedTime": "2020-07-10T09:42:32.951Z",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-0907f22726c996fd5,subnet-0abbcb057289b670d",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::512742231244:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}
```

- Command used to get each asg instance hostname through the webserver
```
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
z@bacon:~$ curl 13.236.121.187
ip-192-168-132-153.ap-southeast-2.compute.internal

z@bacon:~$ curl 3.25.134.255
ip-192-168-108-53.ap-southeast-2.compute.internal

```

- Details of the security group used on the asg
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

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
"instance metadata is available from your running instance, you do not need to use the Amazon EC2 console or the AWS CLI. This can be helpful when you're writing scripts to run from your instance. For example, you can access the local IP address of your instance from instance metadata to manage a connection to an external application."

hostname:The private IPv4 DNS hostname of the instance. 

the line is retreiving the hostname from the instance and writing it to the index.html file.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)