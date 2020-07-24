sg_allowed_ip_addresses   = ["122.148.135.233/32"]
devops_class              = "c04-iac01"
key_pair_name             = "kp-devops"
bucket_name               = "devops-alima-bucket"
ec2_image_id              = "ami-088ff0e3bde7b3fdf"
common_tags = {
  devops-class = "c04-iac01"
  deployed-by  = "terraform"
}