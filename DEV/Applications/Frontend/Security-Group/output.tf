output "frontend_sg_id" {
  description = "ID of the frontend security group"
  value       = aws_security_group.frontend_sg.id
}

output "frontend_sg_name" {
  description = "Name of the frontend security group"
  value       = aws_security_group.frontend_sg.name
}
