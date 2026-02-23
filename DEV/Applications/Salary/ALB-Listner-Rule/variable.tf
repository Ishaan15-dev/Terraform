variable "region" {
  description = "Region for VPC in provider"
  type        = string
  default     = "us-east-1"
}
variable "listener_port" {
  description = "Port on which the listener will listen"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the listener"
  type        = string
  default     = "HTTP"
}

variable "salary_path_patterns" {
  description = "Path patterns for salary API"
  type        = list(string)
  default     = [
    "/api/v1/salary/*",
    "/actuator/health"
  ]
}


variable "listener_rule_priority" {
  description = "Priority for Attendance API listener rule"
  type        = number
  default     = 10
}
