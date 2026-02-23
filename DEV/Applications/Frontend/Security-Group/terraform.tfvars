sg_frontend = "otms-dev-frontend-sg"

ingress_rules = [
  {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
  }
]
