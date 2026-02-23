variable "template_name" {
  description = "Name of Launch Template"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Launch Template"
  type        = string
}

variable "instance_type" {
  description = "Instance type for Launch Template"
  type        = string
}

variable "key_name" {
  description = "Key Pair name"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs across different AZs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for instances"
  type        = string
}

variable "lt_tags" {
  description = "Tags for Launch Template instances"
  type        = map(string)
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
}

variable "lt_version" {
  description = "Version of Launch Template to use in ASG"
  type        = string
}

variable "launch_template_id" {
  description = "Optional: Use existing Launch Template ID"
  type        = string
  default     = null
}

variable "target_group_arn" {
  description = "Optional: ARN of existing Target Group"
  type        = string
  default     = null
}

variable "tg_name" {
  description = "Name of Target Group"
  type        = string
}

variable "port" {
  description = "Port for Target Group"
  type        = number
}

variable "protocol" {
  description = "Protocol for Target Group"
  type        = string
}

variable "target_type" {
  description = "Target type (instance, ip, lambda)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for Target Group"
  type        = string
}

variable "health_check_interval" {
  description = "Time interval between health checks"
  type        = number
}

variable "health_check_path" {
  description = "Path for HTTP health checks"
  type        = string
}

variable "health_check_protocol" {
  description = "Protocol for health checks"
  type        = string
}

variable "health_check_timeout" {
  description = "Timeout for health check responses"
  type        = number
}

variable "healthy_threshold" {
  description = "Number of successful health checks before marking healthy"
  type        = number
}

variable "unhealthy_threshold" {
  description = "Number of failed health checks before marking unhealthy"
  type        = number
}

variable "asg_tags" {
  description = "Tags for ASG instances"
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  }))
}

variable "enable_asg_policy" {
  description = "Enable creation of ASG scaling policies"
  type        = bool
  default     = false
}

variable "asg_policy_name" {
  description = "Custom name for ASG scaling policy"
  type        = string
}

variable "asg_policy_type" {
  description = "Type of ASG scaling policy (TargetTrackingScaling/StepScaling)"
  type        = string
  default     = "TargetTrackingScaling"
}

variable "estimated_instance_warmup" {
  description = "Instance warm-up time for ASG policy"
  type        = number
  default     = 300
}

variable "predefined_metric_type" {
  description = "Predefined metric type for TargetTrackingScaling"
  type        = string
  default     = "ASGAverageCPUUtilization"
}

variable "asg_policy_target_value" {
  description = "Target value for ASG scaling metric"
  type        = number
}

variable "step_adjustment_type" {
  description = "Adjustment type for Step Scaling"
  type        = string
  default     = "ChangeInCapacity"
}

variable "step_metric_interval_lower_bound" {
  description = "Lower bound for metric interval in Step Scaling"
  type        = number
  default     = 0
}

variable "step_scaling_adjustment" {
  description = "Scaling adjustment for Step Scaling"
  type        = number
  default     = 1
}

variable "alb_arn" {
  description = "ARN of the ALB"
  type        = string
}

variable "enable_http_listener" {
  description = "Enable HTTP listener on ALB"
  type        = bool
  default     = false
}

variable "enable_https_listener" {
  description = "Enable HTTPS listener on ALB"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "ARN of SSL certificate for HTTPS listener"
  type        = string
  default     = ""
}

variable "lr_tags" {
  description = "Tags for Listener Rule"
  type        = map(string)
}

variable "listener_rules" {
  description = "List of listener rules for ALB"
  type = list(object({
    path_pattern = string
    rule_name    = string
    priority     = number
  }))
  default = []
}

variable "alb_listener_action" {
  description = "Action type for ALB listener rule (forward/redirect)"
  type        = string
  default     = "forward"
}

variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-southeast-1"
}

variable "tg_tags" {
  description = "Tags for the Target Group"
  type        = map(string)
  default     = {}
}
