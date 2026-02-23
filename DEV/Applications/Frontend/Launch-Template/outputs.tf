output "frontend_lt_id" {
  description = "ID of the frontend launch template"
  value       = aws_launch_template.frontend_lt.id
}

output "frontend_lt_name" {
  description = "Name of the frontend launch template"
  value       = aws_launch_template.frontend_lt.name
}

output "frontend_lt_arn" {
  description = "ARN of the frontend launch template"
  value       = aws_launch_template.frontend_lt.arn
}
