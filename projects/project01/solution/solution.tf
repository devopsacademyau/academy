module "networking" {
  source              = "./networking"

  project-name        = "solution"
  vpc-cidr            = "10.0.0.0/16"

  private_nacl_custom = []
  public_nacl_custom  = [
    {
      type      = "ingress"
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
      from_port = "443"
      to_port   = "443"
    }
  ]
}
