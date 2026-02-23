variable "tg_name" {
  description = "Name of the target group"
  type        = string
  default     = "otms-dev-frontend-TG"
}

variable "tg_port" {
  description = "Port for the target group"
  type        = number
  default     = 3000
}

variable "tg_protocol" {
  description = "Protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "tg_health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/"
}
