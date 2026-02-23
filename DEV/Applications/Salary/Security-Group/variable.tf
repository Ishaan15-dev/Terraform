variable "region" {
  description = "Region for VPC in provider"
  type        = string
  default     = "us-east-1"
}


variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    { from_port = 22,   to_port = 22,   protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 443, to_port =443 , protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 5432, to_port = 5432, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 6379, to_port = 6379, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9042, to_port = 9042, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  ]
}



variable "sg_salary" {
  description = "Name of the security group"
  type        = string
  default     = "otms-dev-salary-sg"
}
