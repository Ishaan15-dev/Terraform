output "ssh_key_name" {
  value       = aws_key_pair.dev_ssh.key_name
  description = "SSH key name from Network-Skeleton"
}
