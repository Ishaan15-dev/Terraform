variable "vpc_id" {
  description = "already exists vpc id"
  type        = string
  default     = "vpc-0c71537eb589400ab"

}


variable "region" {
  description = "region for vpc in provider"
  type        = string
  default     = "us-east-1"

}
