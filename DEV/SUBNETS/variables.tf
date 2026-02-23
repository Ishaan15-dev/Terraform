variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "tags_map" {
  description = "Additional tags map"
  type        = map(string)
  default     = {}   
}

variable "public_subnets" {
  description = "Public subnets"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "Private subnets"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
}
