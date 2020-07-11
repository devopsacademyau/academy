# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
Create the launch config for the Autoscaling group :

 aws autoscaling create-launch-configuration \
 --launch-configuration-name ramya-launch-config \
 --key-name Devopsacademy --image-id ami-0a58e22c727337c51 \
 --security-groups sg-04c7c173261c8c2c1 --instance-type t2.nano \
 --user-data file://ramyadevops-userdata.txt    --associate-public-ip-address 

 Create Autoscaling group.

  aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name ramya-asg \
    --launch-configuration-name ramya-launch-config \
    --min-size 1 --max-size 2 --desired-capacity 2 \
    --health-check-grace-period 120 \
    --vpc-zone-identifier "subnet-04c9d82c36567dcc6, subnet-0ad9dc31135c0f2d8"

```

- Command used to get each asg instance hostname through the webserver
```
a. http://54.252.217.112/
   ip-172-16-98-42.ap-southeast-2.compute.internal

b  http://52.63.85.210/
   ip-172-16-40-186.ap-southeast-2.compute.internal

```

- Details of the security group used on the asg
```
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

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
This command retrieves the local hostname from the instance metadata and add to the index.html
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)