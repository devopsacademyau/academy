#!/bin/bash
f_name = "Vishaal";
l_name = "Pal";
instance_id = $(curl http://169.254.169.254/latest/meta-data/instance-id);
region = $(curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}');
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
printf "Hello $f_name $l_name \nInstance ID $instance_id \nRegion $region" > /var/www/html/index.html