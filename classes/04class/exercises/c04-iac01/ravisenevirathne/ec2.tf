
data "aws_ami" "latest-amazone-linux_image" {
    most_recent = true
    owners =  ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-kernel-*"]
    }
}

resource "aws_instance" "EC2" {
   
    ami = data.aws_ami.latest-amazone-linux_image.id
    instance_type = "t2.micro"
    key_name = "ravisenevirathne"
    vpc_security_group_ids = [aws_security_group.SG.id]

    tags = {
    name = "ravisenevirathne C04-iac01"
    }
}


