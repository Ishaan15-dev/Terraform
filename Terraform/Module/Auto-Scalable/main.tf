###############################################
# Launch Template
###############################################
resource "aws_launch_template" "launch_template" {
  name_prefix   = var.template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    security_groups = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.lt_tags
  }
}

###############################################
# Target Group
###############################################
resource "aws_lb_target_group" "target_group" {
  name        = var.tg_name
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id

  health_check {
    interval            = var.health_check_interval
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }

  tags = var.tg_tags
}

###############################################
# Auto Scaling Group
###############################################
resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids

  target_group_arns = [
    var.target_group_arn != null ? var.target_group_arn : aws_lb_target_group.target_group.arn
  ]

  launch_template {
    id      = var.launch_template_id != null ? var.launch_template_id : aws_launch_template.launch_template.id
    version = var.lt_version
  }

  dynamic "tag" {
    for_each = var.asg_tags
    content {
      key                 = tag.value.key
      value               = tag.value.value
      propagate_at_launch = tag.value.propagate_at_launch
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

###############################################
# Auto Scaling Policies
###############################################
resource "aws_autoscaling_policy" "asg_policy_target_tracking" {
  count                     = var.enable_asg_policy && var.asg_policy_type == "TargetTrackingScaling" ? 1 : 0
  name                      = var.asg_policy_name
  autoscaling_group_name    = aws_autoscaling_group.asg.name
  policy_type               = var.asg_policy_type
  estimated_instance_warmup = var.estimated_instance_warmup

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }
    target_value = var.asg_policy_target_value
  }
}

resource "aws_autoscaling_policy" "asg_policy_step_scaling" {
  count                  = var.enable_asg_policy && var.asg_policy_type == "StepScaling" ? 1 : 0
  name                   = var.asg_policy_name
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = var.asg_policy_type
  adjustment_type        = var.step_adjustment_type

  step_adjustment {
    metric_interval_lower_bound = var.step_metric_interval_lower_bound
    scaling_adjustment          = var.step_scaling_adjustment
  }
}

###############################################
# Load Balancer Listeners
###############################################
resource "aws_lb_listener" "http" {
  count             = var.enable_http_listener ? 1 : 0
  load_balancer_arn = var.alb_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  count             = var.enable_https_listener ? 1 : 0
  load_balancer_arn = var.alb_arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn != null ? var.target_group_arn : aws_lb_target_group.target_group.arn
  }
}

###############################################
# Listener Rule
###############################################
resource "aws_lb_listener_rule" "listener_rule" {
  for_each = { for r in var.listener_rules : r.rule_name => r }

listener_arn = (
  length(aws_lb_listener.https) > 0 ? aws_lb_listener.https[0].arn :
  length(aws_lb_listener.http) > 0 ? aws_lb_listener.http[0].arn : null
)


  priority = each.value.priority

  action {
    type             = var.alb_listener_action
    target_group_arn = var.target_group_arn != null ? var.target_group_arn : aws_lb_target_group.target_group.arn
  }

  condition {
    path_pattern {
      values = [each.value.path_pattern]
    }
  }

  tags = var.lr_tags

  depends_on = [aws_lb_target_group.target_group]
}
