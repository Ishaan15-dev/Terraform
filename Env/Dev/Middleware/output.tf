output "instance_private_ip" {
  description = "Private IPs of the Redis EC2 instances"
  value       = module.redis.instance_private_ip
}

output "instance_id" {
  description = "Redis EC2 instance IDs"
  value       = module.redis.instance_id
}

output "elastic_ip" {
  description = "Elastic IPs associated with Redis instances"
  value       = module.redis.elastic_ip
}
