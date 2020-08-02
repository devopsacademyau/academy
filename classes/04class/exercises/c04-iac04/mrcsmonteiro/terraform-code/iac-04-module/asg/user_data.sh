#!/bin/bash
sudo yum update
sudo amazon-linux-extras install epel -y
sudo yum install httpd -y
sudo yum install stress -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
curl 169.254.169.254/latest/meta-data/hostname >> /var/www/html/index.html
sudo stress --cpu 1 --timeout 600 &
