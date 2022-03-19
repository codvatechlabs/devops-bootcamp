module "asg-alb-demo" {
  source                  = "git::https://github.com/CodvaTech-Labs/asg_module.git"
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  lb_security_group_name  = var.lb_security_group_name
  asg_security_group_name = var.asg_security_group_name
  lb_name                 = var.lb_name
  asg_name                = var.asg_name
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity
}