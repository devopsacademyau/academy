# Create security group to allow traffic on port 22 (SSH) via internet
resource "aws_security_group" "mayu_dojo_sg" {
  name        = "mayu_dojo_sg"                                         # Specify security group name
  description = "Allow SSH traffic on port 22"                         # Description for security group. 
  tags = {
    name = "mayu-dojo"                                                 # tag for resource groupingg
  }

# Adding inbound rule for Security group
  ingress {
    description = "SSH"                                                # specify which port to use for inbound connection request
    from_port   = 22                                                   # Port valie. usually 22 for SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.193.184.101/32"]                                # Define IP range
  }

# Adding outbound rule for any traffic that allowed inbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}