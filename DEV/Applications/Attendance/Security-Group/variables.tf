
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "sg_attendance" {
  description = "Name of the security group"
  type        = string
  default     = "otms-dev-attendance-sg"
}

variable "ingress_rules" {
  description = "List of ingress rules for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    description = optional(string)
  }))
  default = []
}

variable "ssh_ip" {
  description = "SSH access"
  type        = string
}
