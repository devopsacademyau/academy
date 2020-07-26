module "lb_asg" {
    source = "./iac-04-module"
    ami = "ami-0a58e22c727337c51"
    asg_policy_up = 1
    asg_policy_down = 1
    subnets = data.aws_subnet_ids.default.ids
}


