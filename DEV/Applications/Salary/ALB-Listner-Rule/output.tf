
output "salary_listener_arn" {
  description = "ARN of the salary ALB listener"
  value       = aws_lb_listener.salary_listener.arn
}

output "salary_listener_port" {
  description = "Port of the salary ALB listener"
  value       = aws_lb_listener.salary_listener.port
}
