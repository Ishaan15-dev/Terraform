###################################################
# Module: Auto Scalable
###################################################
module "Auto-Scalable" {
  source = "git::https://sunnnyyk123@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Module/Infra/Auto-Scalable?ref=SCRUM-492-tina"

  template_name      = var.template_name
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_ids         = [data.terraform_remote_state.network.outputs.private_subnet_ids[1]]
  security_group_id  = lookup(data.terraform_remote_state.network.outputs.security_group_ids, "notification")

  lt_tags            = local.lt_tags

  # Target Group (port 9200)
  tg_name            = "${var.tg_name}-9200"
  port               = 9200
  protocol           = "HTTP"
  target_type        = "instance"
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id

  health_check_interval  = 30
  health_check_path      = "/"
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
      value               = "${var.env}-notification"
      propagate_at_launch = true
    }
  ])

  # Auto Scaling Policy
  enable_asg_policy          = var.enable_asg_policy
  asg_policy_name            = "${var.env}-cpu-target-policy"
  asg_policy_type            = "TargetTrackingScaling"
  asg_policy_target_value    = var.asg_policy_target_value
  predefined_metric_type     = "ASGAverageCPUUtilization"
  estimated_instance_warmup  = 300

  # ALB Config (disable default listeners)
  alb_arn               = data.terraform_remote_state.network.outputs.alb_arn
  enable_http_listener  = true
  enable_https_listener = false

  lr_tags             = local.lr_tags
  listener_rules      = var.listener_rules
  alb_listener_action = var.alb_listener_action
}

###################################################
# Custom Listener for Port 9200
###################################################
# Creates a listener directly on the ALB pointing to the TG created by the module
resource "aws_lb_listener" "custom_9200" {
  load_balancer_arn = data.terraform_remote_state.network.outputs.alb_arn
  port              = 9200
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = module.Auto-Scalable.target_group_arn
  }
}

###################################################
# Optional Output
###################################################
output "custom_listener_arn" {
  value = aws_lb_listener.custom_9200.arn
}
