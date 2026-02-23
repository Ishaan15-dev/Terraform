# ================================
# Data Sources
# ================================
data "terraform_remote_state" "otms_ns_main" {
  backend = "s3"
  config = {
    bucket = "otms-env-dev-cloud-ops-crew"
    key    = "Network_skeleton/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

# Use aws_ami from data.tf only
# Ensure there is no duplicate aws_ami in this file

# ================================
# Module: Auto Scaling
# ================================
module "asg" {
  source = "git::https://divyamishra-ai:@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Module/Infra/Auto-Scalable?ref=SCRUM-492-tina"

  template_name     = var.template_name
  ami_id            = data.aws_ami.salary_ami.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_ids        = data.terraform_remote_state.otms_ns_main.outputs.private_subnet_ids
  security_group_id = data.terraform_remote_state.otms_ns_main.outputs.security_group_ids["salary"]
  lt_tags           = local.lt_tags

  asg_name           = var.asg_name
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arn   = var.target_group_arn != null ? var.target_group_arn : null
  launch_template_id = var.launch_template_id
  lt_version         = var.lt_version
  asg_tags           = local.asg_tags

  enable_http_listener  = var.enable_http_listener
  enable_https_listener = false

  alb_arn             = data.terraform_remote_state.otms_ns_main.outputs.alb_arn
  listener_rules      = var.listener_rules
  alb_listener_action = var.alb_listener_action
  lr_tags             = local.lr_tags

  asg_policy_name                  = var.asg_policy_name
  asg_policy_type                  = var.asg_policy_type
  estimated_instance_warmup        = var.estimated_instance_warmup
  predefined_metric_type           = var.predefined_metric_type
  asg_policy_target_value          = var.asg_policy_target_value
  enable_asg_policy                = var.enable_asg_policy
  step_adjustment_type             = var.step_adjustment_type
  step_metric_interval_lower_bound = var.step_metric_interval_lower_bound
  step_scaling_adjustment          = var.step_scaling_adjustment

  tg_name               = var.tg_name
  port                  = var.port
  protocol              = var.protocol
  target_type           = var.target_type
  vpc_id                = data.terraform_remote_state.otms_ns_main.outputs.vpc_id
  health_check_interval = var.health_check_interval
  health_check_path     = var.health_check_path
  health_check_protocol = var.health_check_protocol
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold

  tg_tags = {
    Name  = "${var.env}-${var.application_name}-tg"
    env   = var.env
    owner = var.owner
  }
}
