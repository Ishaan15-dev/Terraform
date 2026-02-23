# Private subnets by Name
output "api_private_subnet_id" {
  value = [
    for s in aws_subnet.private : s.id
    if s.tags["Name"] == "otms-dev-api-private-subnet"
  ][0]
}

output "frontend_private_subnet_id" {
  value = [
    for s in aws_subnet.private : s.id
    if s.tags["Name"] == "otms-dev-frontend-private-subnet"
  ][0]
}

output "db_private_subnet_id" {
  value = [
    for s in aws_subnet.private : s.id
    if s.tags["Name"] == "otms-dev-db-private-subnet"
  ][0]
}

# Public subnets by Name
output "public_subnet_a_id" {
  value = [
    for s in aws_subnet.public : s.id
    if s.tags["Name"] == "otms-dev-public-subnet-01"
  ][0]
}

output "public_subnet_b_id" {
  value = [
    for s in aws_subnet.public : s.id
    if s.tags["Name"] == "otms-dev-public-subnet-02"
  ][0]
}
