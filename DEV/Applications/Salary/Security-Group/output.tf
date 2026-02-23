output "salary_sg_id" {
  description = "ID of the notification security group"
  value       = aws_security_group.salary_sg.id
}

output "salary_sg_name" {
  description = "Name of the notification security group"
  value       = aws_security_group.salary_sg.name
}
