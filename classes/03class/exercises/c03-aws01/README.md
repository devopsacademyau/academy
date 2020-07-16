# Auto Scaling Group

Create an Auto Scaling Group with the following details:
- AMI: `Amazon Linux Image 2`
- Type: `t2.nano`
- Name: `any name`
- Minimum/Maximum/Desired: `1/2/2`
- Security group: `create a new one to allow connection from anywhere to port 80`
- VPC: `devopsacademy-vpc`
- Subnet: `any two public subnet`
- User-data:

```bash
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname > index.html
mv index.html /var/www/html/
systemctl start httpd
```

Questions:

- access through your browser each instance IP on port 80 `http://<instance-ip>` and post the hostname of each one
- what this line is doing? `curl 169.254.169.254/latest/meta-data/hostname > index.html`

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)s

- **README.md**: copy from file [ANSWER.md](ANSWER.md), containing your answers.
