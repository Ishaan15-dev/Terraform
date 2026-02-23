variable "sg_frontend" {
  description = "Name of the security group"
  type        = string
  default     = "otms-dev-frontend-sg"
}

variable "ingress_rules" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
  default = [
    {
      from_port = 3000
      to_port   = 3000
      protocol  = "tcp"
    }
  ]
}
