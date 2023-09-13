#!/usr/bin/env bash
# script to create two ec2 instances and their security groups
# the private ec2 is only accessed through the bastion host
aws ec2 create-security-group --group-name bastion-sg --description "bastion access with ssh"

aws ec2 authorize-security-group-ingress --group-id <bastion-sg id> --protocol tcp --port 22 --cidr "$(curl https://checkip.amazonaws.com)/32"

aws ec2 create-security-group --group-name private-sg --description "restrict internal access"

aws ec2 authorize-security-group-ingress --group-id <private-sg id> --protocol tcp --port 22 --source-group bastion-sg

aws ec2 create-key-pair --key-name  aws101 --query 'KeyMaterial' --output text > aws101.pem

aws ec2 run-instances --image-id  ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name aws101 --security-group-ids <bastion-sg id>

aws ec2 describe-instances --instance-id <created instance id>

aws ec2 run-instances --image-id  ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name aws101 --security-group-ids <private-sg id> --no-associate-public-ip-address
