output "salary_asg_id" {
  description = "ID of the salary Auto Scaling Group"
  value       = aws_autoscaling_group.salary_asg.id
}

output "salary_asg_name" {
  description = "Name of the salary Auto Scaling Group"
  value       = aws_autoscaling_group.salary_asg.name
}

output "salary_asg_arn" {
  description = "ARN of the salary Auto Scaling Group"
  value       = aws_autoscaling_group.salary_asg.arn
}

output "salary_asg_desired_capacity" {
  description = "Desired capacity of the salary ASG"
  value       = aws_autoscaling_group.salary_asg.desired_capacity
}

output "salary_asg_min_size" {
  description = "Minimum size of the salary ASG"
  value       = aws_autoscaling_group.salary_asg.min_size
}

output "salary_asg_max_size" {
  description = "Maximum size of the salary ASG"
  value       = aws_autoscaling_group.salary_asg.max_size
}
