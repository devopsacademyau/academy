# Create security group 
resource "aws_security_group" "sg" {
  name        = "allow-ssh"
  description = "Allow inbound SSH traffic"

# Create ingress rules
  ingress {
    description = "Allow "
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Create egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Apply tags to resource
  tags = {
    Name     = "Allow SSH"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}
