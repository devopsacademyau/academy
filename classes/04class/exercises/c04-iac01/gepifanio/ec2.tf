resource "aws_instance" "ec2-instance" {
    ami = var.ami
    instance_type   = var.instance_type
    availability_zone = var.availability_zone
    key_name = var.key_pair_name
    iam_instance_profile = aws_iam_instance_profile.iam-profile.name

    tags = {
        Name = "IaC-Ec2"
    }
}