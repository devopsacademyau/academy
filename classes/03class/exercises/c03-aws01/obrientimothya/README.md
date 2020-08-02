# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
VPC="vpc-09a3c6830a6d58479"
SG=$(aws ec2 create-security-group \
    --group-name "autoscaling-sg" \
    --description "autoscaling group" \
    --vpc-id "${VPC}" \
    --profile tobrien)
aws ec2 authorize-security-group-ingress \
    --group-id "${SG}" \
    --ip-permissions IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges='[{CidrIp=0.0.0.0/0,Description="HTTP 80 Anywhere"}]' \
    --profile tobrien

USERDATA=`base64 <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
EOF`

aws ec2 create-launch-template \
    --launch-template-name launchtemplate-devops \
    --launch-template-data '{"NetworkInterfaces":[{"DeviceIndex":0,"AssociatePublicIpAddress":true,"Groups":["'$SG'"],"DeleteOnTermination":true}],"ImageId":"ami-0a58e22c727337c51","InstanceType":"t2.nano","KeyName":"devopsacademy-keypair","UserData":"'$USERDATA'"}' \
    --profile tobrien
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name "asg-devopsacademy01" \
    --min-size 1 \
    --max-size 2 \
    --desired-capacity 2 \
    --launch-template "LaunchTemplateName=launchtemplate-devops,Version=1" \
    --vpc-zone-identifier "subnet-0038a09635262c6ff,subnet-076b647b8a2e6aea4" \
    --availability-zones ap-southeast-2a ap-southeast-2b \
    --profile tobrien

OUTPUT

LAUNCHTEMPLATE	2020-07-19T16:06:31+00:00	arn:aws:iam::437637330966:user/tobrien	1	1	lt-0105018fb80a58f03	launchtemplate-devops

```

- Command used to get each asg instance hostname through the webserver
```
curl http://13.210.205.233
curl http://54.206.116.123

OUTPUT

ip-10-0-1-83.ap-southeast-2.compute.internal
ip-10-0-3-222.ap-southeast-2.compute.internal
```

- Details of the security group used on the asg
```
VPC="vpc-09a3c6830a6d58479"
aws ec2 describe-security-groups \
    --group-ids "sg-05b87257b8bceb2cb" \
    --profile tobrien
```

OUTPUT

SECURITYGROUPS  autoscaling group       sg-05b87257b8bceb2cb    autoscaling-sg  437637330966    vpc-09a3c6830a6d58479
IPPERMISSIONS   80      tcp     80
IPRANGES        0.0.0.0/0       HTTP 80 Anywhere
IPPERMISSIONSEGRESS     -1
IPRANGES        0.0.0.0/0

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
Sending a HTTP GET request to the Amazon API hostname endpoint, which returns the node's DNS hostname.
The result body of the request is then being piped to the local file, index.html
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)
