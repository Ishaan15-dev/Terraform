variable "region" {
  description = "Region for VPC in provider"
  type        = string
  default     = "us-east-1"
}


variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
  default     = "otms-dev-salary-LT"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0bd58cc0bff192ff8"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for EC2 instances created from launch template"
  type        = string
  default     = "otms-dev-salary-api"
}

