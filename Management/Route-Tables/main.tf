# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-dev-public-rt"
  })
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-dev-private-rt"
  })
}

# Public Route Table Associations
resource "aws_route_table_association" "public" {
  for_each = toset([
    data.terraform_remote_state.subnets.outputs.public_subnet_a_id,
    data.terraform_remote_state.subnets.outputs.public_subnet_b_id
  ])

  subnet_id      = each.value
  route_table_id = aws_route_table.public.id
}

# Private Route Table Associations
resource "aws_route_table_association" "private" {
  for_each = toset([
    data.terraform_remote_state.subnets.outputs.api_private_subnet_id,
    data.terraform_remote_state.subnets.outputs.db_private_subnet_id,
    data.terraform_remote_state.subnets.outputs.frontend_private_subnet_id
  ])

  subnet_id      = each.value
  route_table_id = aws_route_table.private.id
}


# Default route for Internet in Public RT
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.terraform_remote_state.igw.outputs[var.igw_output_name]
}

# Default route for Private RT via NAT Gateway
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.terraform_remote_state.natgateway.outputs[var.natgw_output_name]
}
