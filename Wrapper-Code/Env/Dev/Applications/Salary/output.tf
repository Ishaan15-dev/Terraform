output "asg_name" {
  description = "Name of the Auto Scaling Group created"
  value       = module.asg.asg_name
}

output "launch_template_id" {
  description = "Launch Template ID used by the ASG"
  value       = module.asg.launch_template_id
}

output "target_group_arn" {
  description = "ARN of the Target Group created or used by the ASG"
  value       = module.asg.target_group_arn
}

output "salary_listener_rules" {
  value = module.asg.listener_rule_arns
}
