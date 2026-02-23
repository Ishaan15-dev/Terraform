output "frontend_tg_arn" {
  description = "ARN of the frontend target group"
  value       = aws_lb_target_group.frontend_tg.arn
}

output "frontend_tg_name" {
  description = "Name of the frontend target group"
  value       = aws_lb_target_group.frontend_tg.name
}

output "frontend_tg_id" {
  description = "ID of the frontend target group"
  value       = aws_lb_target_group.frontend_tg.id
}
