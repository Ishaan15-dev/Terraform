variable "region" {
  description = "Region for VPC in provider"
  type        = string
  default     = "us-east-1"
}


variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 0
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
  default     = 0
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "asg_name" {
  description = "Name of the ASG"
  type        = string
  default     = "otms-dev-salary-asg"

}
