output "instance_private_ip" {
  description = "Private IPs of the EC2 instances"
  value       = module.postgresdb.instance_private_ip
}

output "instance_id" {
  description = "EC2 instance IDs"
  value       = module.postgresdb.instance_id
}
