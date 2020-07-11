# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
aws autoscaling create-launch-configuration \
    --launch-configuration-name LC-devopsacademy \
    --image-id ami-0a58e22c727337c51 \
    --instance-type t2.nano \
    --associate-public-ip-address \
    --security-groups sg-0ba93234733a2660b \
    --user-data file://classes/03class/exercises/c03-aws01/gepifanio/userdata.txt


aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name ASG-devopsacademy \
    --launch-configuration-name LC-devopsacademy \
    --min-size 1 \
    --max-size 2 \
    --desired-capacity 2 \
    --vpc-zone-identifier "subnet-0c341aabdd7fc51d6, subnet-0300fc4a8e14db404" 



```

- Command used to get each asg instance hostname through the webserver
```
aws autoscaling describe-auto-scaling-groups \
    --auto-scaling-group-names ASG-devopsacademy
    
{
    "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "ASG-devopsacademy",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:873547843801:autoScalingGroup:fb68c027-ec8e-44a1-9f4e-f5ed6f123526:autoScalingGroupName/ASG-devopsacademy",
            "LaunchConfigurationName": "LC-devopsacademy",
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
                    "InstanceId": "i-0a4e523a362cc816b",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2b",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "LC-devopsacademy",
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-0db48c0b15ad847ac",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchConfigurationName": "LC-devopsacademy",
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-07-09T14:04:18.380000+00:00",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-0c341aabdd7fc51d6,subnet-0300fc4a8e14db404",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::873547843801:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }
    ]
}

aws ec2 describe-instances --instance-id i-0a4e523a362cc816b --query 'Reservations[].Instances[].PublicIpAddress'

[
    "54.253.89.85"
]


curl 54.253.89.85
ip-10-0-202-143.ap-southeast-2.compute.internal%

aws ec2 describe-instances --instance-id i-0db48c0b15ad847ac --query 'Reservations[].Instances[].PublicIpAddress'

[
    "52.62.182.181"
]

curl 52.62.182.181
ip-10-0-161-42.ap-southeast-2.compute.internal%

```

- Details of the security group used on the asg
```
aws ec2 create-security-group \
    --description "security group for ASG" \
    --group-name SG-ASG-devopsacademy \
    --vpc-id vpc-018717ea8ed22e6ae

{
    "GroupId": "sg-0ba93234733a2660b"
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-0ba93234733a2660b \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
This line is getting the hostname of the instance created using the command curl, and output the result of the command which is the hostname of the ec2 instance in a index.html, which is hosted in the root of the instance, and when you try to hit the instance using you browser will render the index.html file with the hostname of the instance. 

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)