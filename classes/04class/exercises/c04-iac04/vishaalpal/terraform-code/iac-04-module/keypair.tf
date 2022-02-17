# How to retrieve public key material - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#retrieving-the-public-key
# Reference an EC2 key pair
resource "aws_key_pair" "mykey" {
  key_name   = "c04-iac04"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCDI+XkgYknXNbHoa9RZXhR1etVExdF8sZEnn1ZvQl5WP7HCvx25sb8eWpDaM1qjtKNiJhA6NLtl0IWArtrcfJMlNn5lF/xSEGFQbItJaPZQPCY7J1SZ3Fv08aVHom/o4Apbd+p8+SsYvxwJnwnQN1AXI9StPFlYFf0jv0JnWb202IHf9grycEdBSlTFZgtIS+UBvKlbqy903FE5BRnOg1bzNxHF7xnSRAPVGoEmce0AFl7kDkqeZnnT7tuDer2i2Ae5iuFCNjXGto0V3dIldj69xpKwrPRSj3CcfPY2LEvCB1GZfZsOgo9QOCRYdNNiG7loHxOpmMB0C+BJSIfbQ3N"
}
