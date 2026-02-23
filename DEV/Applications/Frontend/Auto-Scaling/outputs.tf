output "frontend_asg_id" {
  description = "ID of the frontend Auto Scaling Group"
  value       = aws_autoscaling_group.frontend_asg.id
}

output "frontend_asg_name" {
  description = "Name of the frontend Auto Scaling Group"
  value       = aws_autoscaling_group.frontend_asg.name
}

output "frontend_asg_arn" {
  description = "ARN of the frontend Auto Scaling Group"
  value       = aws_autoscaling_group.frontend_asg.arn
}

output "frontend_asg_desired_capacity" {
  description = "Desired capacity of the frontend ASG"
  value       = aws_autoscaling_group.frontend_asg.desired_capacity
}

output "frontend_asg_min_size" {
  description = "Minimum size of the frontend ASG"
  value       = aws_autoscaling_group.frontend_asg.min_size
}

output "frontend_asg_max_size" {
  description = "Maximum size of the frontend ASG"
  value       = aws_autoscaling_group.frontend_asg.max_size
}
