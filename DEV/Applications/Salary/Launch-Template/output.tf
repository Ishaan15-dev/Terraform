output "salary_lt_id" {
  description = "ID of the frontend launch template"
  value       = aws_launch_template.salary_lt.id
}

output "salary_lt_name" {
  description = "Name of the frontend launch template"
  value       = aws_launch_template.salary_lt.name
}

output "salary_lt_arn" {
  description = "ARN of the frontend launch template"
  value       = aws_launch_template.salary_lt.arn
}
