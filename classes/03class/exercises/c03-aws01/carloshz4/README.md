# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:

First get vpc id
```
aws ec2 describe-vpcs  --filter Name=tag:Name,Values=devopsacademy-vpc --query "Vpcs[].VpcId" --output text
vpc-012017b09f0dae62e
```

- Details of the security group used on the asg
```
aws ec2 create-security-group --group-name SGPublicWeb --description "DA Public SG Web access" --vpc-id vpc-012017b09f0dae62e
-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-01d50088425fc716b  |
+----------+------------------------+

aws ec2 authorize-security-group-ingress --group-id sg-01d50088425fc716b --protocol tcp --port 80 --cidr 0.0.0.0/0
```


Create Launch configuration
```
aws autoscaling create-launch-configuration \
--launch-configuration-name devopsacademy-launch-config \
--key-name kp_public \
--image-id ami-0a58e22c727337c51 \
--instance-type t2.nano \
--security-groups sg-01d50088425fc716b \
--associate-public-ip-address \
--user-data file://userdata.txt
```

where userdata.txt:
```
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
```

Create Auto Scaling Group
```
aws autoscaling create-auto-scaling-group --auto-scaling-group-name devopsacademy-asg --launch-configuration-name devopsacademy-launch-config --min-size 1 --max-size 2 --desired-capacity 2 --vpc-zone-identifier "subnet-0d38b36b10174c83e,subnet-0cc747f574e20158a"
```


- Command used to get each asg instance hostname through the webserver
```
http://54.252.191.198/
ip-10-10-4-160.ap-southeast-2.compute.internal

http://54.206.12.10/
ip-10-10-0-119.ap-southeast-2.compute.internal
```


- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
Retrieves metadata from the running instance. In this case, it queries the instance's hostname and redirects the output to the file index.html
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)
