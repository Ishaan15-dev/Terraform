variable "template_name" {
  description = "Name of LT"
  type        = string
}

variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "owner" {
  description = "Owner tag"
  type        = string
}

variable "project_name" {
  description = "Name of project"
  type        = string
}

variable "application_name" {
  description = "Name of application"
  type        = string
}

variable "instance_type" {
  description = "Instance size"
  type        = string
}

variable "key_name" {
  description = "Key Pair name"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "lt_version" {
  description = "Version for LT in ASG"
  type        = string
}

variable "launch_template_id" {
  description = "Optional: Launch Template ID"
  type        = string
  default     = null
}

variable "target_group_arn" {
  description = "Optional: ARN of existing TG"
  type        = string
  default     = null
}

variable "alb_listener_action" {
  description = "ALB action type"
  type        = string
  default     = "forward"
}

variable "asg_policy_name" {
  description = "Custom name for scaling policy"
  type        = string
}

variable "asg_policy_type" {
  description = "Policy type"
  type        = string
  default     = "TargetTrackingScaling"
}

variable "estimated_instance_warmup" {
  description = "Warm-up time"
  type        = number
  default     = 300
}

variable "predefined_metric_type" {
  description = "Metric type"
  type        = string
  default     = "ASGAverageCPUUtilization"
}

variable "asg_policy_target_value" {
  description = "Target value"
  type        = number
}

variable "enable_asg_policy" {
  description = "Enable ASG policy"
  type        = bool
  default     = false
}

variable "step_adjustment_type" {
  description = "Step scaling adjustment type"
  type        = string
  default     = "ChangeInCapacity"
}

variable "step_metric_interval_lower_bound" {
  description = "Step metric lower bound"
  type        = number
  default     = 0
}

variable "step_scaling_adjustment" {
  description = "Step scaling adjustment"
  type        = number
  default     = 1
}

variable "tg_name" {
  description = "Target Group name"
  type        = string
}

variable "port" {
  description = "Port"
  type        = number
}

variable "protocol" {
  description = "Protocol"
  type        = string
}

variable "target_type" {
  description = "Target type (instance, ip, lambda)"
  type        = string
}

variable "health_check_interval" {
  description = "Health check interval"
  type        = number
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
}

variable "health_check_timeout" {
  description = "Health check timeout"
  type        = number
}

variable "healthy_threshold" {
  description = "Healthy threshold"
  type        = number
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold"
  type        = number
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "enable_http_listener" {
  description = "Enable HTTP listener"
  type        = bool
}

variable "listener_rules" {
  description = "List of listener rules"
  type = list(object({
    path_pattern = string
    rule_name    = string
    priority     = number
  }))
  default = [
    {
      path_pattern = "/api/v1/employee*"
      rule_name    = "dev-employee-listener-rule-1"
      priority     = 2
    }
  ]
}
