output "dev_infra_pub_nat" {
    description = "The ID of the first public subnet"
  value = aws_nat_gateway.dev_infra_pub_nat.id
}
