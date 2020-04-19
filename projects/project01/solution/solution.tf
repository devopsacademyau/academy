module "networking" {
  source = "./networking"

  project-name = "solution"
  vpc-cidr = "10.0.0.0/16"
}
