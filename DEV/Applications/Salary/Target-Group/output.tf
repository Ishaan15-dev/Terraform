output "salary_tg_arn" {
  description = "ARN of the frontend target group"
  value       = aws_lb_target_group.salary_tg.arn
}

output "salary_tg_name" {
  description = "Name of the frontend target group"
  value       = aws_lb_target_group.salary_tg.name
}

output "salary_tg_id" {
  description = "ID of the frontend target group"
  value       = aws_lb_target_group.salary_tg.id
}
