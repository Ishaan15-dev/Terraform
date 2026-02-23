
variable "asg_policy_name" {
  type        = string
  default     = "otms-dev-frontend-target-tracking"
  description = "Name of the autoscaling policy"
}

variable "target_cpu_utilization" {
  type        = number
  default     = 50.0
  description = "Target CPU utilization % for the ASG policy"
}
