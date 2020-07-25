# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
aws ec2 create-security-group --group-name devops-sg-asg --description "Allow connection to port 80" --vpc-id vpc-060a0763bc0be9c60
{
    "GroupId": "sg-0e737c4ebe3a62461"
}

aws ec2 authorize-security-group-ingress --group-id sg-0e737c4ebe3a62461 --cidr 0.0.0.0/0 --port 80 --protocol tcp

aws autoscaling create-launch-configuration --launch-configuration-name devops-launch-config --user-data file://userdata.txt --image-id ami-0a58e22c727337c51 --instance-type t2.nano --security-groups sg-0e737c4ebe3a62461 --associate-public-ip-address


aws autoscaling describe-launch-configurations --launch-configuration-names devops-launch-config
{
    "LaunchConfigurations": [
        {
            "LaunchConfigurationName": "devops-launch-config",
            "LaunchConfigurationARN": "arn:aws:autoscaling:ap-southeast-2:722281479696:launchConfiguration:52c10d17-f133-4f35-82a1-a8ee31b5619d:launchConfigurationName/devops-launch-config",
            "ImageId": "ami-0a58e22c727337c51",
            "KeyName": "",
            "SecurityGroups": [
                "sg-0e737c4ebe3a62461"
            ],
            "ClassicLinkVPCSecurityGroups": [],
            "UserData": "IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQ=",
            "InstanceType": "t2.nano",
            "KernelId": "",
            "RamdiskId": "",
            "BlockDeviceMappings": [],
            "InstanceMonitoring": {
                "Enabled": true
            },
            "CreatedTime": "2020-07-25T08:19:59.998000+00:00",
            "EbsOptimized": false,
            "AssociatePublicIpAddress": true
        }
    ]
}



aws autoscaling create-auto-scaling-group --auto-scaling-group-name asg-devopsc03 --min-size 1 --max-size 2 --desired-capacity 2 --launch-configuration-name devops-launch-config --vpc-zone-identifier "subnet-02adcb39ac8470cbb,subnet-0f7b5ad371edc09dd"
    

aws autoscaling describe-auto-scaling-groups
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "asg-devopsc03",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:722281479696:autoScalingGroup:989e322b-cb88-4bca-976b-136cdd2cae95:autoScalingGroupName/asg-devopsc03",
            "LaunchConfigurationName": "devops-launch-config",
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
                    "InstanceId": "i-02a023f674fe1e45f",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "devops-launch-config",
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-054bafb6e78fe36de",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2b",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "devops-launch-config",
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-07-25T08:38:41.382000+00:00",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-0f7b5ad371edc09dd,subnet-02adcb39ac8470cbb",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::722281479696:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}


    
```

- Command used to get each asg instance hostname through the webserver
```
aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceType == t2.nano"


aws ec2 describe-instances --query "Reservations[*].Instances[*].{Id:InstanceId,DnsName:PrivateDnsName,IpAddress:PublicIpAddress,State:State.Name,Zone:Placement.AvailabilityZone}"
[
    [
        {
            "Id": "i-054bafb6e78fe36de",
            "DnsName": "ip-192-168-64-71.ap-southeast-2.compute.internal",
            "IpAddress": "13.211.134.79",
            "State": "running",
            "Zone": "ap-southeast-2b"
        }
    ],
    [
        {
            "Id": "i-0db84e7f953e3d7c3",
            "DnsName": "ip-172-31-35-185.ap-southeast-2.compute.internal",
            "IpAddress": null,
            "State": "stopped",
            "Zone": "ap-southeast-2a"
        }
    ],
    [
        {
            "Id": "i-099bb6200752ceb89",
            "DnsName": "ip-172-31-33-42.ap-southeast-2.compute.internal",
            "IpAddress": null,
            "State": "stopped",
            "Zone": "ap-southeast-2a"
        }
    ],
    [
        {
            "Id": "i-02a023f674fe1e45f",
            "DnsName": "ip-192-168-29-187.ap-southeast-2.compute.internal",
            "IpAddress": "3.25.131.132",
            "State": "running",
            "Zone": "ap-southeast-2a"
        }
    ]
]
```

- Details of the security group used on the asg
```
aws ec2 describe-security-groups --group-id sg-0e737c4ebe3a62461
{
    "SecurityGroups": [
        {
            "Description": "Allow connection to port 80",
            "GroupName": "devops-sg-asg",
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
            "OwnerId": "722281479696",
            "GroupId": "sg-0e737c4ebe3a62461",
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
            "VpcId": "vpc-060a0763bc0be9c60"
        }
    ]
}
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
Creating an index.html file with the metadata from the running instance. The IP address 169.254.169.254 is a link-local address and is valid only from the instance.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)