# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
$ cat << EOF > ~/AWS/files/devops-academy-c03-aws01-userdata.txt
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
EOF

$ aws autoscaling create-launch-configuration \
    --launch-configuration-name devops-academy-launch-config \
    --image-id ami-0a58e22c727337c51 \
    --instance-type t2.nano \
    --user-data file://~/AWS/files/devops-academy-c03-aws01-userdata.txt \
    --associate-public-ip-address \
    --security-groups sg-010e9583a629eae27

$ aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name devops-academy-asg \
    --launch-configuration-name devops-academy-launch-config \
    --min-size 1 \
    --max-size 2 \
    --desired-capacity 2 \
    --vpc-zone-identifier "subnet-012cc488da2a78bcd,subnet-01c5db45e8f5eda43,subnet-0f04d5a771b8895fd" \
    --tags "Key=Name,Value=DevOpsAcademyWebServer"
```

- Command used to get each asg instance hostname through the webserver
```
$ curl https://169.254.169.254/latest/meta-data/hostname
```

- Details of the security group used on the asg
```
$ aws ec2 create-security-group \
    --group-name devops-academy-http-sg \
    --description "DevOps Academy security group for HTTP traffic" \
    --vpc-id vpc-0721e28436cea8410

{
    "GroupId": "sg-010e9583a629eae27"
}

$ aws ec2 authorize-security-group-ingress \
    --group-id sg-010e9583a629eae27 \
    --protocol tcp \
    --port 80 \
    --cidr 0.0.0.0/0

$ aws ec2 create-tags \
    --resources sg-010e9583a629eae27 \
    --tags Key=Name,Value="DevOps Academy HTTP SG"
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
It retrieves a top-level metadata (hostname in this case) and sends the output to the index.html file, which will be shown when the webserver's public IP is typed into a browser or 'curled'.

# Output for the curl command against the two public IPs for the webservers from my laptop

➜  ~ curl 3.25.84.248
ip-10-11-11-70.ap-southeast-2.compute.internal

➜  ~ curl 54.206.211.142
ip-10-11-22-98.ap-southeast-2.compute.internal
```

***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)
