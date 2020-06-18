module network {
    source = "./network"
    vpccidr = var.vpccidr
    projectname = var.projectname
    publicsubnets = var.publicsubnets
}

module asg {
    source = "./asg"
    ami = var.ami
    key_name = var.key_name
    inst_type = var.inst_type
    projectname = var.projectname
    asg_dependson = [module.network.security_group_id]
    publicsubnets = var.publicsubnets
    publicsubnets_ids = module.network.publicsubnetsids
    albarn = module.alb.albarn
}
module alb {
    source = "./alb"
    projectname = var.projectname
    publicsubnets_ids = module.network.publicsubnetsids
    asg_dependson = [module.network.security_group_id]
    vpcid = module.network.vpc_id
}