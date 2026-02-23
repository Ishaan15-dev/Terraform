output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.Auto-Scalable.asg_name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = module.Auto-Scalable.target_group_arn
}


output "frontend_http_listener_arn" {
  value       = module.Auto-Scalable.listener_arns["http"]
  description = "HTTP listener ARN from frontend module"
}

output "frontend_https_listener_arn" {
  value       = module.Auto-Scalable.listener_arns["https"]
  description = "HTTPS listener ARN from frontend module"
}
