output "attendance_sg_id" {
  description = "ID of the attendance security group"
  value       = aws_security_group.attendance_sg.id
}

output "attendance_sg_name" {
  description = "Name of the attendance security group"
  value       = aws_security_group.attendance_sg.name
}
