variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Deployment environment name (e.g. dev, prod)"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to your local public SSH key file"
  type        = string
}
