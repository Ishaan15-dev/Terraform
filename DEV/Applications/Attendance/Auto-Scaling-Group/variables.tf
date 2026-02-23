
variable "aws_region" {
  description = "AWS region"
  type        = string
}


variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 1
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_name" {
  description = "Name of the ASG"
  type        = string
  default     = "otms-dev-attendance-asg"
}

variable "asg_health_check_type" {
  description = "Type of health check for the Auto Scaling Group (EC2 or ELB)"
  type        = string
  default     = "EC2"
}

variable "asg_health_check_grace_period" {
  description = "Time (in seconds) to wait before starting health checks on a new instance"
  type        = number
  default     = 300
}
