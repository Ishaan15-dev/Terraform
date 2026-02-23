variable "env" {
  description = "Environment name (dev, qa, prod)"
  type        = string
  default     = "dev"
}

variable "application" {
  description = "Application name"
  type        = string
  default     = "otms"
}

variable "owner" {
  description = "Owner of resources"
  type        = string
  default     = "apt-get-swag"
}

variable "cost_center" {
  description = "Cost center tag"
  type        = string
  default     = "CC-101"
}


variable "template_name" {
  description = "Name of the Launch Template"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}


variable "asg_name" {
  description = "ASG name"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}


variable "tg_name" {
  description = "Target Group name"
  type        = string
}

variable "port" {
  description = "Target Group port"
  type        = number
  default     = 9200
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}


variable "certificate_arn" {
  description = "SSL certificate ARN"
  type        = string
  default     = ""
}

variable "enable_https_listener" {
  description = "Enable HTTPS listener"
  type        = bool
  default     = false
}

variable "listener_rules" {
  description = "ALB listener rules"
  type = list(object({
    path_pattern = string
    rule_name    = string
    priority     = number
  }))
  default = []
}

variable "alb_listener_action" {
  description = "ALB listener action (forward/redirect)"
  type        = string
  default     = "forward"
}


variable "enable_asg_policy" {
  description = "Enable ASG scaling policy"
  type        = bool
  default     = true
}

variable "asg_policy_target_value" {
  description = "Target CPU % for scaling"
  type        = number
  default     = 60
}
