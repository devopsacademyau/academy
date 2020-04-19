module "networking" {
  source = "./networking"

  project_name = var.project_name
  vpc_cidr     = "10.0.0.0/16"

  private_nacl_custom = []
  public_nacl_custom = [
    {
      type      = "ingress"
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
      from_port = "443"
      to_port   = "443"
    }
  ]
}

module "application" {
  source = "./application"

  project_name        = var.project_name
  app_name            = var.app_name
  vpc_id              = module.networking.vpc_id
  private_subnets_ids = module.networking.private_subnet_ids

  db = {
    engine           = "aurora"
    engine_mode      = "serverless"
    subnet_group     = module.networking.db_private_subnet_group
    username         = "admin"
    backup_retention = 12
  }

  ecs_nodes = {
    asg = {
      instance_type_1 = "t3.large"
      instance_type_2 = "t2.large"
      instance_type_3 = "m2.xlarge"

      spot_instance_pools = 3
      on_demand_base_capacity = 0
      on_demand_percentage = 0

      min_size = 1
      max_size = 1

      target_group_arns = []
      default_cooldown = 300
      health_check_grace_period = 180
    }
    
    lc = {
      ebs_root_size = 30
    }
  }
}
