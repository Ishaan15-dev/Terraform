resource "aws_security_group" "attendance_sg" {
  name   = var.sg_attendance
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  # HTTP from ALB (port 5001)
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = [data.terraform_remote_state.alb.outputs.alb_sg_id]
      description     = lookup(ingress.value, "description", null)
    }
  }

  # SSH from your IPv4
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_ip]        
    description = "SSH Access"
  }

  # All outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}
