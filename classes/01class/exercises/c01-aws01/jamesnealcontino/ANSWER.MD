### Creating an EC2 instance in default VPC with public IP

- aws ec2 run-instances --image-id ami-0210560cedcb09f07 --count 1 --instance-type t3.micro --key-name neljn-contino-tf-exercise --associate-public-ip-address
- removing the "" so it only has --associate-public-ip-addressa private IP 

#### Extra info
- Key pair was created later due to other lesson
- Not choosing subnet or vpc to launch it in defaults
