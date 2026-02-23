###############################################
# Launch Template Output
###############################################
output "launch_template_id" {
  value       = aws_launch_template.launch_template.id
  description = "ID of the launch template"
}

output "launch_template_name" {
  value       = aws_launch_template.launch_template.name
  description = "Name of the launch template"
}

###############################################
# Auto Scaling Group Output
###############################################
output "asg_id" {
  value       = aws_autoscaling_group.asg.id
  description = "ID of the Auto Scaling group"
}

output "asg_name" {
  value       = aws_autoscaling_group.asg.name
  description = "Name of the Auto Scaling group"
}

###############################################
# Target Group Output
###############################################
output "target_group_arn" {
  value       = aws_lb_target_group.target_group.arn
  description = "ARN of the target group"
}

output "target_group_name" {
  value       = aws_lb_target_group.target_group.name
  description = "Name of the target group"
}

###############################################
# Listener Output
###############################################
output "listener_arns" {
  value = {
    http  = length(aws_lb_listener.http) > 0 ? aws_lb_listener.http[0].arn : null
    https = length(aws_lb_listener.https) > 0 ? aws_lb_listener.https[0].arn : null
  }
  description = "ARNs of HTTP and HTTPS listeners"
}

###############################################
# Listener Rules Output
###############################################
output "listener_rule_arns" {
  value = {
    for lr in aws_lb_listener_rule.listener_rule :
    lr.id => lr.arn  
  }
  description = "Map of listener rule IDs to ARNs"
}

###############################################
# Auto Scaling Policy Outputs
###############################################
output "asg_policy_target_tracking_arn" {
  value       = length(aws_autoscaling_policy.asg_policy_target_tracking) > 0 ? aws_autoscaling_policy.asg_policy_target_tracking[0].arn : null
  description = "ARN of the target tracking ASG policy"
}

output "asg_policy_step_scaling_arn" {
  value       = length(aws_autoscaling_policy.asg_policy_step_scaling) > 0 ? aws_autoscaling_policy.asg_policy_step_scaling[0].arn : null
  description = "ARN of the step scaling ASG policy"
}
