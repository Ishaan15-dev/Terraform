variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
  default     = "otms-dev-frontend-LT"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0df82e0030a01b9da"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "instance_name" {
  description = "Name tag for EC2 instances created from launch template"
  type        = string
  default     = "otms-dev-frontend-api"
}
