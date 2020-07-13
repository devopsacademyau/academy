# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
 1. I used the devopsacademy-vpc created in the previous classes.
 > aws ec2 describe-vpcs --vpc-ids vpc-042fd98e61209aa1e
   {
       "Vpcs": [
           {
               "CidrBlock": "10.10.0.0/16",
               "DhcpOptionsId": "dopt-a2f9d0c5",
               "State": "available",
               "VpcId": "vpc-042fd98e61209aa1e",
               "OwnerId": "238730634896",
               "InstanceTenancy": "default",
               "CidrBlockAssociationSet": [
                   {
                       "AssociationId": "vpc-cidr-assoc-060ef3aaf84c022ab",
                       "CidrBlock": "10.10.0.0/16",
                       "CidrBlockState": {
                           "State": "associated"
                       }
                   }
               ],
               "IsDefault": false,
               "Tags": [
                   {
                       "Key": "Name",
                       "Value": "devopsacademy-vpc"
                   }
               ]
           }
       ]
   }

 2. Added Security Group Inbound rule to allow traffic from internet to access at port 80 

 > aws ec2 authorize-security-group-ingress --group-id sg-0816f7b7fd2f99678 --protocol tcp --port 80 --cidr 0.0.0.0/0 

   Below are the Security Group Rules summary
 
  > aws ec2 describe-security-groups --group-ids sg-0816f7b7fd2f99678 

    {
      "SecurityGroups": [
        {
            "Description": "devopsacademy public SG",
            "GroupName": "public-sg",
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
                },
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "14.203.197.155/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "238730634896",
            "GroupId": "sg-0816f7b7fd2f99678",
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
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-sg"
                }
            ],
            "VpcId": "vpc-042fd98e61209aa1e"
        }
    ]
   }

  3. Created userdata_script.txt file with the below contents.
	#! /bin/bash
	yum update -y
	yum install -y httpd
	curl 169.254.169.254/latest/meta-data/hostname > index.html
	mv index.html /var/www/html/
	systemctl start httpd
     
     Changed this file to base64 format for AWS to understand and process the userdata.
     > base64 -i userdata_script.txt -o userdata_base64.txt
     > cat userdata_base64.txt
       IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQK

  4. Created launchtemplate.jason file with below contents.
	{
	"ImageId":"ami-088ff0e3bde7b3fdf",
	"InstanceType":"t2.nano",
	"KeyName": "mummaserver",
	"UserData":"IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQK",
	"NetworkInterfaces":[
 	{
	  "AssociatePublicIpAddress":true,
	  "DeviceIndex":0,
	  "Groups":["sg-0816f7b7fd2f99678"],
	  "DeleteOnTermination":true
	 }
 	 ]
	 }

  5. Created Launch Template using the below command.
  > aws ec2 create-launch-template --launch-template-name web-server-template --version-description web-ltv1 --launch-template-data file://launchtemplate.json 
	{
	 "LaunchTemplate": {
       	 "LaunchTemplateId": "lt-0584c71da2920f82e",
       	 "LaunchTemplateName": "webserver-template",
       	 "CreateTime": "2020-07-13T15:05:27+00:00",
         "CreatedBy": "arn:aws:iam::238730634896:user/admin",
         "DefaultVersionNumber": 1,
         "LatestVersionNumber": 1
             }
        }

   6. Created Auto Scaling Group using below command. 
   > aws autoscaling create-auto-scaling-group --auto-scaling-group-name webserver-asg --launch-template LaunchTemplateId=lt-0584c71da2920f82e --min-size 1 --max-size 2 --desired-capacity 2 --availability-zones ap-southeast-2a ap-southeast-2b --vpc-zone-identifier "subnet-0c8c2609ac6874ace,subnet-09fef27936067ada2"

   7. Confirm Auto Scaling Group and instance details as below
   > aws autoscaling describe-auto-scaling-instances 
	{
	    "AutoScalingInstances": [
	       	 {
	            "InstanceId": "i-069d274b553b03aab",
 	            "InstanceType": "t2.nano",
	            "AutoScalingGroupName": "webserver-asg",
	            "AvailabilityZone": "ap-southeast-2b",
	            "LifecycleState": "InService",
 	            "HealthStatus": "HEALTHY",
   	            "LaunchTemplate": {
	                    "LaunchTemplateId": "lt-0584c71da2920f82e",
	                    "LaunchTemplateName": "webserver-template",
	       	            "Version": "1"
                 },
                "ProtectedFromScaleIn": false
                },
             {
	            "InstanceId": "i-0f18d7dcb941ec874",
	            "InstanceType": "t2.nano",
	            "AutoScalingGroupName": "webserver-asg",
 	            "AvailabilityZone": "ap-southeast-2a",
	            "LifecycleState": "InService",
	            "HealthStatus": "HEALTHY",
	            "LaunchTemplate": {
	                "LaunchTemplateId": "lt-0584c71da2920f82e",
	                "LaunchTemplateName": "webserver-template",
	                "Version": "1"
	            },
	            "ProtectedFromScaleIn": false
	        }
	    ]
	}


   > aws autoscaling describe-auto-scaling-groups 
      {
      "AutoScalingGroups": [
        {
            "AutoScalingGroupName": "webserver-asg",
            "AutoScalingGroupARN": "arn:aws:autoscaling:ap-southeast-2:238730634896:autoScalingGroup:dad831dd-50de-4dcb-901d-c18de2f72374:autoScalingGroupName/webserver-asg",
            "LaunchTemplate": {
                "LaunchTemplateId": "lt-0584c71da2920f82e",
                "LaunchTemplateName": "webserver-template"
            },
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
                    "InstanceId": "i-069d274b553b03aab",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2b",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchTemplate": {
                        "LaunchTemplateId": "lt-0584c71da2920f82e",
                        "LaunchTemplateName": "webserver-template",
                        "Version": "1"
                    },
                    "ProtectedFromScaleIn": false
                },
                {
                    "InstanceId": "i-0f18d7dcb941ec874",
                    "InstanceType": "t2.nano",
                    "AvailabilityZone": "ap-southeast-2a",
                    "LifecycleState": "InService",
                    "HealthStatus": "Healthy",
                    "LaunchTemplate": {
                        "LaunchTemplateId": "lt-0584c71da2920f82e",
                        "LaunchTemplateName": "webserver-template",
                        "Version": "1"
                    },
                    "ProtectedFromScaleIn": false
                }
            ],
            "CreatedTime": "2020-07-13T15:07:01.093000+00:00",
            "SuspendedProcesses": [],
            "VPCZoneIdentifier": "subnet-0c8c2609ac6874ace,subnet-09fef27936067ada2",
            "EnabledMetrics": [],
            "Tags": [],
            "TerminationPolicies": [
                "Default"
            ],
            "NewInstancesProtectedFromScaleIn": false,
            "ServiceLinkedRoleARN": "arn:aws:iam::238730634896:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
         }
      ]
    }


```

- Command used to get each asg instance hostname through the webserver
```

  > curl http://3.25.60.170:80
    ip-10-10-2-157.ap-southeast-2.compute.internal

  > curl http://3.25.141.93:80
    ip-10-10-1-184.ap-southeast-2.compute.internal

```

- Details of the security group used on the asg
```

  > aws ec2 describe-security-groups --group-ids sg-0816f7b7fd2f99678 

    {
      "SecurityGroups": [
        {
            "Description": "devopsacademy public SG",
            "GroupName": "public-sg",
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
                },
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "14.203.197.155/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "238730634896",
            "GroupId": "sg-0816f7b7fd2f99678",
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
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-sg"
                }
            ],
            "VpcId": "vpc-042fd98e61209aa1e"
        }
    ]
   }

```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
 AWS instance metadata details can be retrieved from http://169.254.169.254/latest/metadata. If hostname is appended to the above URI, it will provide the FQDN of private IP details of the instance.
 Please note that retriving metadata is a HTTP service and the command https://169.254.169.254/latest/meta-data/hostname wont work as the service is not listeing at HTTP/443.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)
