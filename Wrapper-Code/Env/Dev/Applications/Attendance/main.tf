
module "Auto-Scalable" {
  source = "git::https://kawalpreet-kour:g 4@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Module/Infra/Auto-Scalable?ref=SCRUM-492-tina"

  template_name     = var.template_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_ids        = data.terraform_remote_state.otms_ns_main.outputs.private_subnet_ids
  security_group_id = lookup(data.terraform_remote_state.otms_ns_main.outputs.security_group_ids, "attendance")

  lt_tags = local.lt_tags

  tg_name     = var.tg_name
  port        = var.port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.otms_ns_main.outputs.vpc_id

  health_check_interval = var.health_check_interval
  health_check_path     = var.health_check_path
  health_check_protocol = var.health_check_protocol
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold

  tg_tags = local.tg_tags

  asg_name         = var.asg_name
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
  lt_version       = "$Latest"

  asg_tags = concat(local.asg_tags, [
    {
      key                 = "Name"
      value               = "${var.env}-attendance"
      propagate_at_launch = true
    }
  ])

  enable_asg_policy         = var.enable_asg_policy
  asg_policy_name           = var.asg_policy_name
  asg_policy_type           = var.asg_policy_type
  asg_policy_target_value   = var.asg_policy_target_value
  predefined_metric_type    = var.predefined_metric_type
  estimated_instance_warmup = var.estimated_instance_warmup

  alb_arn               = data.terraform_remote_state.otms_ns_main.outputs.alb_arn
  enable_http_listener  = var.enable_http_listener
  enable_https_listener = var.enable_https_listener
  certificate_arn       = var.certificate_arn

  lr_tags             = local.lr_tags
  listener_rules      = var.listener_rules
  alb_listener_action = var.alb_listener_action
}
