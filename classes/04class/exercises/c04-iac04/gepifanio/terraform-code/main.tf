module "network" {
    source = "./modules/network"	
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
}

module "asg" {
    source = "./modules/asg"
    vpc_id = module.network.vpc_id
    ami = "ami-0a58e22c727337c51"
    instance_type = "t2.micro"
    asg_policy_up = 1
    asg_policy_down = -1
    public_subnets = module.network.public_subnets
    lb_arn = module.lb.lb_arn
}

module "lb" {
    source = "./modules/lb"
    vpc_id = module.network.vpc_id
    public_subnets = module.network.public_subnets
}

