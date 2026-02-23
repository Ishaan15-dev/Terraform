output "asg_name" {
  description = "Auto Scaling Group Name"
  value       = aws_autoscaling_group.attendance_asg.name
}

output "asg_id" {
  description = "Auto Scaling Group ID"
  value       = aws_autoscaling_group.attendance_asg.id
}

output "asg_arn" {
  description = "ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.attendance_asg.arn
}
