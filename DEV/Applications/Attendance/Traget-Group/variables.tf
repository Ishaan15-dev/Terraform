variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "tg_name" {
  description = "Name of the target group"
  type        = string
}

variable "tg_port" {
  description = "Port for the target group"
  type        = number
}

variable "tg_protocol" {
  description = "Protocol for the target group"
  type        = string
}

variable "tg_health_check_path" {
  description = "Health check path for the target group"
  type        = string
}
