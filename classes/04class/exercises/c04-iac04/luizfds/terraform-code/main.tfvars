aws_region      = "ap-southeast-2"
aws_amis = {
  ap-southeast-2 = "ami-0970010f"
}
vpc_id        = "vpc-81383de6"
subnets       = ["subnet-33736d7a", "subnet-e722cf81", "subnet-082db150"]
instance_type = "t2.micro"
min_size      = 1
max_size      = 3
