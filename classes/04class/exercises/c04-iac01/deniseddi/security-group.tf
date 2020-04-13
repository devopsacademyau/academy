#Create Security Group.The EC2 instance needs to be accessible through SSH(Port 22)
resource "aws_security_group" "da-sg-test" {
  name        = "da-sg-test"
  description = "Allow inbound traffic"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  tags = {
    Name = "da-sg-test"
  }
}
