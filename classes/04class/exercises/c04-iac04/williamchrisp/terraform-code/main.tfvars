# Variables to be used
vpc_cidr            = "10.0.0.0/16"
subnet1_public_cidr = "10.0.1.0/24"
subnet1_public_name = "public-a"
subnet2_public_cidr = "10.0.2.0/24"
subnet2_public_name = "public-b"
## Ensure ami is in the correct region.
ami                = "ami-0c2ab3b8efb09f272"
key_pair           = "williamchrisp-us-west-2"
high_cpu_threshold = "60"
low_cpu_threshold  = "30"