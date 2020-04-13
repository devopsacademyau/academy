module "iac04_module" {
    source ="/Users/siyuanhu/Projects/academy/classes/04class/exercises/c04-iac04/hsy3418/terraform-code/iac-04-module"
    ami = "ami-0970010f37c4f9c8d"
    subnets = [
        {
        name = "public-a-iac04"
        cidr = "10.0.0.0/24"
        az   = "ap-southeast-2a"
        },
        {
        name = "public-b-iac04"
        cidr = "10.0.1.0/24"
        az   = "ap-southeast-2b"
         }
    ]
    asg_policies = [
        {
        name = "policy_up"
        scaling_adjustment = 1
        adjustment_type   = "ChangeInCapacity"
        cooldown = 300

         },
         {
        name = "policy_down"
        scaling_adjustment = 1
        adjustment_type   = "ChangeInCapacity"
        cooldown = 300
        }
]
}