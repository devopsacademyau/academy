resource "aws_security_group" "sg-allow-ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"

    ingress {
        description = "SSH from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sg_allow_ssh"
    }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
    security_group_id    = aws_security_group.sg-allow-ssh.id
    network_interface_id = aws_instance.ec2-instance.primary_network_interface_id
}