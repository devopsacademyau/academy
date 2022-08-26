# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:

Create a file titled userdata.txt with user data that was supplied in the exercise

```
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
```
Run the below command to create an EC2 instance 

```
aws ec2 run-instances --image-id ami-0742b4e673072066f --count 1 --instance-type t2.nano --tag-specifications 'ResourceType=instance, Tags=[{ Key=Name,Value=mayu-dojo}]' --security-group-ids sg-087afe8df7adbfd0f --user-data file://userdata.txt
```

Verify the instance created through the AWS Management console. Note down the Instance ID address for next part.

We will need to create a Launch Template for our Auto Scaling Group with the same configuration as the instance we previously launched.

Run the following command to create an AMI of our current instance

```
aws ec2 create-image --instance-id i-0efb9878656518db7 --name ASGCLI

Output
    {
        "ImageId": "ami-05f93851824c4843c"
    }
```

Create a Launch Template using our AMI. The below command will set the Security Group, set the Instance Type, set Tags, and Region.

```
aws ec2 create-launch-template \
    --launch-template-name MayuDojoASGTemplate \
    --version-description AutoScalingVersion1 \
    --launch-template-data '{"NetworkInterfaces":[{"DeviceIndex":0,"AssociatePublicIpAddress":true,"Groups":["sg-087afe8df7adbfd0f"],"DeleteOnTermination":true}],"ImageId":"ami-05f93851824c4843c","InstanceType":"t2.nano","TagSpecifications":[{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"MayuDojoASG"}]}]}' --region us-east-1


Output
    {
        "LaunchTemplate": {
            "LaunchTemplateId": "lt-0b7ab3e1ecadc8175",
            "LaunchTemplateName": "MayuDojoASGTemplate",
            "CreateTime": "2022-08-24T04:48:15+00:00",
            "CreatedBy": "arn:aws:sts::152848913167:assumed-role/AWSReservedSSO_AdministratorAccess_9a5c1e6656f53c81/mayu.thombre@contino.io",
            "DefaultVersionNumber": 1,
            "LatestVersionNumber": 1
        }
    }
```

To create our Auto Scaling Group run the following command:


```
aws autoscaling create-auto-scaling-group --auto-scaling-group-name MayuDojoASG --launch-template "LaunchTemplateName=MayuDojoASGTemplate" --min-size 1 --max-size 2 --desired-capacity 2 --availability-zones "us-east-1a" "us-east-1b" "us-east-1c"

Now run the following command to list all the instances created using the MayuDojoASG

aws ec2 describe-instances --filters "Name=tag:Name,Values=MayuDojoASG" --query "Reservations[].Instances[].InstanceId"

Output
    [
        "i-0cd7e6c99f6ade243",
        "i-0b9f2f7371d72d5a1"
    ]
```


- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
It retrieves a top-level metadata of the instance (hostname in this case) and sends the output to the index.html file, which will be shown when the webserver's public IP is typed into a browser or 'curled'.

# Output for the curl command against the two public IPs for the webservers from my laptop

➜  ~ curl 44.202.155.58
ip-10-11-11-70.us-east-1.compute.internal

➜  ~ curl 44.206.211.142
ip-10-11-22-98.us-east-1.compute.internal
```

***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)



