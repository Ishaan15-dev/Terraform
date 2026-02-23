variable "region" {
  description = "Region for VPC in provider"
  type        = string
  default     = "us-east-1"
}

variable "root_domain_name" {
  description = "The root domain or subdomain to create the Route53 record for"
  type        = string
}

variable "hosted_zone_id" {
  description = "The Route53 Hosted Zone ID where the record will be created"
  type        = string
}

variable "record_type" {
  description = "The type of the DNS record (e.g., A, CNAME)"
  type        = string
  default     = "A"
}
