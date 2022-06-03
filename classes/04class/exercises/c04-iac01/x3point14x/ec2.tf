resource "aws_instance" "bcurrey_iac_1_ec2" {
    # https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/instance
    ami = "ami-0c6120f461d6b39e9"
    instance_type = "t3.nano"
    vpc_security_group_ids = [aws_security_group.bcurrey_iac_1_ssh_sg.id]
    key_name = "bcurrey_devops_test" # Made manually
    iam_instance_profile = aws_iam_instance_profile.bcurrey_iac_1_s3_access_profile.name
    subnet_id = "subnet-f9ef798f"
}