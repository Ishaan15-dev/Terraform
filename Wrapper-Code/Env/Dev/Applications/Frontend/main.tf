module "Auto-Scalable" {
  source = "git::https://Ishaan-Dev1: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@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Module/Infra/Auto-Scalable?ref=SCRUM-492-tina"

  template_name      = var.template_name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_ids         = [data.terraform_remote_state.network.outputs.private_subnet_ids[2]]
  security_group_id  = lookup(data.terraform_remote_state.network.outputs.security_group_ids, "frontend")

  lt_tags            = local.lt_tags

  tg_name            = var.tg_name
  port               = var.port
  protocol           = "HTTP"
  target_type        = "instance"
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id

  health_check_interval  = 30
  health_check_path      = var.health_check_path
  health_check_protocol  = "HTTP"
  health_check_timeout   = 5
  healthy_threshold      = 3
  unhealthy_threshold    = 2

  tg_tags            = local.tg_tags

  asg_name           = var.asg_name
  desired_capacity   = var.desired_capacity
  min_size           = var.min_size
  max_size           = var.max_size
  lt_version         = "$Latest"

  asg_tags = concat(local.asg_tags, [
    {
      key                 = "Name"
      value               = "${var.env}-frontend"
      propagate_at_launch = true
    }
  ])

  enable_asg_policy          = var.enable_asg_policy
  asg_policy_name            = "${var.env}-cpu-target-policy"
  asg_policy_type            = "TargetTrackingScaling"
  asg_policy_target_value    = var.asg_policy_target_value
  predefined_metric_type     = "ASGAverageCPUUtilization"
  estimated_instance_warmup  = 300

  alb_arn               = data.terraform_remote_state.network.outputs.alb_arn
  enable_http_listener  = true
  enable_https_listener = var.enable_https_listener
  certificate_arn       = var.certificate_arn

  lr_tags                = local.lr_tags
  listener_rules         = var.listener_rules
  alb_listener_action    = var.alb_listener_action
}
