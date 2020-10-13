
#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><body>stackname: ${stack_name} hostname: $(hostname -f) in Availability Zone: " > index.html
curl http://169.254.169.254/latest/meta-data/placement/availability-zone >> index.html
echo "</body></html>" >> index.html

