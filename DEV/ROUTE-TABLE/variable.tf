variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "owner" {
  type        = string
  description = "Owner tag for resources"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "Project name prefix for resources"
}

# Backend Config
variable "backend_bucket" {
  type        = string
  description = "S3 bucket for backend state"
}

variable "backend_key" {
  type        = string
  description = "S3 key for backend state"
}

# Remote State Config
variable "remote_state_bucket" {
  type        = string
  description = "S3 bucket for remote states"
}

variable "vpc_state_key" {
  type        = string
  description = "State file key for VPC"
}

variable "subnet_state_key" {
  type        = string
  description = "State file key for Subnets"
}

variable "natgw_state_key" {
  type        = string
  description = "State file key for NAT Gateway"
}

variable "igw_state_key" {
  type        = string
  description = "State file key for Internet Gateway"
}

# Output Names (from remote states)
variable "igw_output_name" {
  type        = string
  description = "Output name for IGW id in remote state"
}

variable "natgw_output_name" {
  type        = string
  description = "Output name for NAT Gateway id in remote state"
}
