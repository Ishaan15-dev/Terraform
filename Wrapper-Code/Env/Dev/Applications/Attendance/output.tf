output "asg_name" {
  description = "Name of the Auto Scaling Group created"
  value       = module.Auto-Scalable.asg_name
}

output "launch_template_id" {
  description = "Launch Template ID used by the ASG"
  value       = module.Auto-Scalable.launch_template_id
}

output "target_group_arn" {
  description = "ARN of the Target Group created or used by the ASG"
  value       = module.Auto-Scalable.target_group_arn
}

output "attendance_listener_rules" {
  value = module.Auto-Scalable.listener_rule_arns
}
