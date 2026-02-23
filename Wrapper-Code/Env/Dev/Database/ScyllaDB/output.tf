output "instance_private_ip" {
  description = "Private IPs of the ScyllaDB EC2 instances"
  value       = module.scylladb.instance_private_ip
}

output "instance_public_ip" {
  description = "Public IPs of the ScyllaDB EC2 instances"
  value       = module.scylladb.instance_public_ip
}

output "instance_id" {
  description = "EC2 instance IDs"
  value       = module.scylladb.instance_id
}

output "elastic_ip" {
  description = "Elastic IPs (if allocated)"
  value       = module.scylladb.elastic_ip
}
