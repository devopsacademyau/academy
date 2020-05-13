#! /bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd.service
service httpd start
curl http://169.254.169.254/latest/meta-data/public-hostname > index.html
mv index.html /var/www/html/