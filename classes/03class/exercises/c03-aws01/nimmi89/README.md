# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
aws autoscaling create-launch-configuration \
    --launch-configuration-name DA-launch-config \
    --security-groups sg-005dc45ad043be6c1 \
    --key-name C01-AWS01KeyPair \
    --image-id ami-0a58e22c727337c51 \
    --instance-type t2.nano --user-data file://userdata.txt \
    --associate-public-ip-address

aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name DA-ASG \
    --launch-configuration-name DA-launch-config \
    --min-size 1 --max-size 2 --desired-capacity 2 \
    --vpc-zone-identifier "subnet-03bbda2e7e877d1fb,subnet-01f03b15624652fc3"

aws autoscaling describe-auto-scaling-groups \
--auto-scaling-group-name DA-ASG
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "DA-ASG",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:438549961569:autoScalingGroup:b6cd106d-abab-48b0-a544-fc008f9391e8:autoScalingGroupName/DA-ASG",
            "LaunchConfigurationName": "my-launch-config",
            "MinSize": 1,
            "MaxSize": 2,
            "DesiredCapacity": 2,
            "DefaultCooldown": 300,
            "AvailabilityZones": [
                "ap-southeast-2a"
            ],
            "LoadBalancerNames": [],
            "TargetGroupARNs": [],
            "HealthCheckType": "EC2",
            "HealthCheckGracePeriod": 0,
            "Instances": [
                {
                    "InstanceId": "i-00a5665a1fdce61ea",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "my-launch-config",
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-0cac9d1ff7483c476",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",

                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "my-launch-config",
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-07-10T00:46:37.227000+00:00",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-03bbda2e7e877d1fb,subnet-01f03b15624652fc3",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::438549961569:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}

```

- Command used to get each asg instance hostname through the webserver
```
Use the curl command to access the webserver on the instances

curl http://54.153.156.86
> ip-172-16-76-31.ap-southeast-2.compute.internal

curl http://13.239.111.13
>ip-172-16-91-143.ap-southeast-2.compute.internal


If your EC2 instance is inside a VPC and it doesn't have a public DNS name, you probably need to enable DNS Hostnames for your VPC. Also make sure that DNS Resolution is enabled.
```

- Details of the security group used on the asg
```
aws ec2 create-security-group --group-name ApacheSecurityGroup \
    --description "Class 3 Apache security group" \
    --vpc-id vpc-081afcee350babdf5
{
    "GroupId": "sg-005dc45ad043be6c1"
}
aws ec2 authorize-security-group-ingress \
    --group-id sg-005dc45ad043be6c1 \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

aws ec2 describe-security-groups \   
    --group-ids  sg-005dc45ad043be6c1 

{
    "SecurityGroups": [
        {
            "Description": "Class 3 Apache security group",
            "GroupName": "ApacheSecurityGroup",
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
            "OwnerId": "438549961569",
            "GroupId": "sg-005dc45ad043be6c1",
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
            "VpcId": "vpc-081afcee350babdf5"
        }
    ]
}

```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`

```
Instance metadata is data about your instance that you can use to configure or manage the running instance.
The IP 169.254.169.254 is used in Amazon EC2 and other cloud computing platforms to distribute metadata to cloud instance. This command is retrieving the hostname from this metadata information and storing in index.html.

```

***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)