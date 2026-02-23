aws_region    = "us-east-1"
sg_attendance = "otms-dev-attendance-sg"
ssh_ip        = "152.58.119.28/32"    
ingress_rules = [
  {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    description = "HTTP Traffic from ALB"
  }
]
