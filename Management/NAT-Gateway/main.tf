# Elastic IP
resource "aws_eip" "dev_infra_eip" {
  domain = "vpc"

  tags = merge(
    {
      Name = var.eip_name
    },
    local.common_tags
  )
}

# NAT Gateway
resource "aws_nat_gateway" "dev_infra_pub_nat" {
  allocation_id = aws_eip.dev_infra_eip.id
  subnet_id     = data.terraform_remote_state.subnets.outputs.public_subnet_a_id

  tags = merge(
     {
      Name = var.nat_gateway_name
    } ,

    local.common_tags
  )

  }
