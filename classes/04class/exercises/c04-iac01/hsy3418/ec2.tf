resource "aws_instance" "example" {
  ami           = "ami-08fdde86b93accf1c"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.example_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.ingress-all-test.id}"]  
  subnet_id = "${aws_subnet.dwe-subnet.id}"
  associate_public_ip_address = "true"
}


