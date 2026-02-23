output "alb_id" {
  description = "ID of the internet-facing ALB"
  value       = aws_lb.app_alb.id
}


output "alb_dns_name" {
  description = "DNS name of the internet-facing ALB"
  value       = aws_lb.app_alb.dns_name
}


output "alb_sg_id" {
  description = "Security Group ID attached to the ALB"
  value       = aws_security_group.alb_sg.id
}


output "alb_arn" {
  description = "ARN of the internet-facing ALB"
  value       = aws_lb.app_alb.arn
}
