# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
$ aws ec2 create-security-group  --group-name Autoscaling-SG   --description  "port 80 from internet"  --vpc-id vpc-0a2b7db4956438d22
{
    "GroupId": "sg-02e5524e6dbdd5cbd"
}

aws ec2 authorize-security-group-ingress  --group-id sg-02e5524e6dbdd5cbd  --ip-permissions IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges=[{CidrIp=0.0.0.0/0}]

$ aws ec2 describe-security-groups  --group-ids sg-02e5524e6dbdd5cbd | grep 80
            "Description": "port 80 from internet",
                    "FromPort": 80,
                    "ToPort": 80,

$ aws autoscaling create-launch-configuration --launch-configuration-name DA-ASG --image-id ami-0a58e22c727337c51 --instance-type t2.nano --security-groups sg-02e5524e6dbdd5cbd --user-data file:///home/fer/repos/academy/classes/03class/exercises/c03-aws01/frdvo/user-data.txt --associate-public-ip-address

$ aws autoscaling describe-launch-configurations
{
    "LaunchConfigurations": [
        {
            "LaunchConfigurationName": "DA-ASG",
            "LaunchConfigurationARN": "arn:aws:autoscaling:ap-southeast-2:165765640813:launchConfiguration:81ab0712-33d8-4c5f-af2b-a4dd5806836a:launchConfigurationName/DA-ASG",
            "ImageId": "ami-0a58e22c727337c51",
            "KeyName": "",
            "SecurityGroups": [
                "sg-02e5524e6dbdd5cbd"
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
            "CreatedTime": "2020-07-13T10:48:31.346Z",
            "EbsOptimized": false,
            "AssociatePublicIpAddress": true
        }
    ]
}

$ aws autoscaling create-auto-scaling-group  --auto-scaling-group-name DA-SG --launch-configuration-name  DA-ASG --min-size 1 --max-size 2 --desired-capacity 2 --vpc-zone-identifier "subnet-01f6ba32065d77e19,subnet-04843486979b4aeb2"

$ aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name DA-SG
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "DA-SG",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:165765640813:autoScalingGroup:7ebcc47c-c7ec-4826-ad3b-201d8aa81014:autoScalingGroupName/DA-SG",
            "LaunchConfigurationName": "DA-ASG",
            "MinSize": 1,
            "MaxSize": 2,
            "DesiredCapacity": 2,
            "DefaultCooldown": 300,
            "AvailabilityZones": [
                "ap-southeast-2a",
                "ap-southeast-2c"
            ],
            "LoadBalancerNames": [],
            "TargetGroupARNs": [],
            "HealthCheckType": "EC2",
            "HealthCheckGracePeriod": 0,
            "Instances": [
                {
                    "InstanceId": "i-088d7819d1a7fabca",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "DA-ASG",
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-0f9384988f3c6605d",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2c",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "DA-ASG",
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-07-13T11:25:14.305Z",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-01f6ba32065d77e19,subnet-04843486979b4aeb2",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::165765640813:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}

```

- Command used to get each asg instance hostname through the webserver
```
$ aws ec2 describe-instances | grep -i publicipadd
                    "PublicIpAddress": "3.106.137.5",
                    "PublicIpAddress": "13.210.96.123",

$ curl 3.106.137.5
ip-172-16-130-199.ap-southeast-2.compute.internal

$ curl 13.210.96.123
ip-172-16-110-158.ap-southeast-2.compute.internal

```

- Details of the security group used on the asg
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
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
This line is reading the hostname from the internal IP that provides meta-data for a instance and writing on index.html file. This IP is a link-local address, which means it works only from inside a EC2 instance and provide metadata this instance in particular. You can get all metadata in http://169.254.169.254/latest/meta-data/

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)