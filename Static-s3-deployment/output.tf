output "s3_bucket_name" {
  value       = module.static_site.s3_bucket_name
  description = "S3 bucket name"
}

output "cloudfront_domain_name" {
  value       = module.static_site.cloudfront_domain_name
  description = "CloudFront distribution domain"
}

output "website_url" {
  value       = "https://${module.static_site.cloudfront_domain_name}"
  description = "Final static website URL"
}

output "waf_arn" {
  value       = module.static_site.waf_arn
  description = "WAF ARN"
}
