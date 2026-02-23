
##########################################
# ❖ General Configuration
##########################################

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "env" {
  description = "Environment name (e.g., Dev, QA, Prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project for tagging and identification"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance for tagging"
  type        = string
}

variable "owner_name" {
  description = "Owner or creator of the project (for tagging)"
  type        = string
}


##########################################
# ❖ EC2 Instance Configuration
##########################################

variable "number_of_instances" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro, t3.medium)"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "API-KEY"
}


##########################################
# ❖ EBS Volume Configuration
##########################################

variable "device_name" {
  description = "Root EBS device name"
  type        = string
  default     = "/dev/sda1"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 30
}

variable "ebs_volume_type" {
  description = "Type of the EBS volume (e.g., gp2, gp3, io1)"
  type        = string
  default     = "gp2"
}

variable "delete_on_termination" {
  description = "Indicates whether the volume should be deleted when instance terminates"
  type        = bool
  default     = true
}


##########################################
# ❖ Elastic IP Configuration
##########################################

variable "allocate_eip" {
  description = "Whether to allocate an Elastic IP for the instance"
  type        = bool
  default     = false
}

variable "eip_domain" {
  description = "Elastic IP domain (typically 'vpc')"
  type        = string
  default     = "vpc"
}
