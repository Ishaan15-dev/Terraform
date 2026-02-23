output "attendance_tg_arn" {
  description = "ARN of the attendance target group"
  value       = aws_lb_target_group.attendance_tg.arn
}

output "attendance_tg_name" {
  description = "Name of the attendance target group"
  value       = aws_lb_target_group.attendance_tg.name
}

output "attendance_tg_id" {
  description = "ID of the attendance target group"
  value       = aws_lb_target_group.attendance_tg.id
}
