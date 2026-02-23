
output "frontend_asg_policy_id" {
  description = "ID of the frontend Auto Scaling Policy"
  value       = aws_autoscaling_policy.frontend_target_tracking.id
}

output "frontend_asg_policy_name" {
  description = "Name of the frontend Auto Scaling Policy"
  value       = aws_autoscaling_policy.frontend_target_tracking.name
}

output "frontend_asg_policy_arn" {
  description = "ARN of the frontend Auto Scaling Policy"
  value       = aws_autoscaling_policy.frontend_target_tracking.arn
}
